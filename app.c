#include "sim.h"


#define MAX_WALKER_TARGET 400

int limitColor(int color) {
    if (color < 0)
        return 0;

    if (color > 255)
        return 255;

    return color;
}

int calc_radius(int x, int y, int center_x, int center_y) {
    int dx = x - center_x;
    int dy = y - center_y;

    if (dx < 0)
        dx = -dx;
    if (dy < 0)
        dy = -dy;

    if (dx > dy)
        return dx;
    return dy;
}

void update_radius(int x, int y, int center_x, int center_y, int *max_radius) {
    int radius = calc_radius(x, y, center_x, center_y);
    if (radius > *max_radius)
        *max_radius = radius;
}

int decode_x(int index) {
    return index >> 16;
}

int decode_y(int index) {
    return index & ((1 << 16) - 1);
}

int isInBorders(int x, int y) {
    return (x >= 0 && x < SIM_X_SIZE && y >= 0 && y < SIM_Y_SIZE);
}

int safeGetUsed(int used[SIM_Y_SIZE][SIM_X_SIZE], int x, int y) {
    if (isInBorders(x, y)) {
        return used[y][x];
    }
    return 0;
}

void killWalker(
    int index,
    int *walkerLast,
    int walkerX[MAX_WALKER_TARGET],
    int walkerY[MAX_WALKER_TARGET]) {
    walkerX[index] = walkerX[*walkerLast];
    walkerY[index] = walkerY[*walkerLast];
    (*walkerLast)--;
}

int applyNearStatic(
    int x,
    int y,
    int used[SIM_Y_SIZE][SIM_X_SIZE],
    int center_x,
    int center_y,
    int *max_radius) {
    int vector_x[8] = {0, 0, 1, -1, 1, 1, -1, -1};
    int vector_y[8] = {1, -1, 0, 0, 1, -1, 1, -1};

    if (safeGetUsed(used, x, y)) {
        return 1;
    }
    for (int i = 0; i < 8; i++) {
        if (safeGetUsed(used, x + vector_x[i], y + vector_y[i])) {
            used[y][x] = safeGetUsed(used, x + vector_x[i], y + vector_y[i]) + 1;

            update_radius(x, y, center_x, center_y, max_radius);
            return 1;
        }
    }
    return 0;
}

void calculateFrame(
    int walkerX[MAX_WALKER_TARGET],
    int walkerY[MAX_WALKER_TARGET],
    int *walkerLast,
    int used[SIM_Y_SIZE][SIM_X_SIZE],
    int *center_x,
    int *center_y,
    int *max_radius) {
    int vector_x[8] = {0, 0, 1, -1, 1, 1, -1, -1};
    int vector_y[8] = {1, -1, 0, 0, 1, -1, 1, -1};

    while (simHasClick()) {
        int index = simGetClick();
        int x = decode_x(index);
        int y = decode_y(index);
        if (x > 1 && x < SIM_X_SIZE && y > 1 && y < SIM_Y_SIZE) {
            used[y][x] = 1;
            *center_x = x;
            *center_y = y;
            *max_radius = 0;
            *walkerLast = -1;
        }
    }

    while (*walkerLast < MAX_WALKER_TARGET - 1) {
        int start_radius = *max_radius + 6;
        int side = simRand() % 4;
        int x, y;
        int border_radius = *center_x;

        if (SIM_X_SIZE - 1 - *center_x > border_radius) {
            border_radius = SIM_X_SIZE - 1 - *center_x;
        }
        if (*center_y > border_radius) {
            border_radius = *center_y;
        }
        if (SIM_Y_SIZE - 1 - *center_y > border_radius) {
            border_radius = SIM_Y_SIZE - 1 - *center_y;
        }

        if (start_radius > border_radius) {
            int offset = simRand() % SIM_X_SIZE;

            if (side == 0) {
                x = 0;
                y = offset;
            } else if (side == 1) {
                x = SIM_X_SIZE - 1;
                y = offset;
            } else if (side == 2) {
                x = offset;
                y = 0;
            } else {
                x = offset;
                y = SIM_Y_SIZE - 1;
            }
        } else {
            int offset = simRand() % (2 * start_radius + 1) - start_radius;

            x = *center_x;
            y = *center_y;

            if (side == 0) {
                x -= start_radius;
                y += offset;
            } else if (side == 1) {
                x += start_radius;
                y += offset;
            } else if (side == 2) {
                x += offset;
                y -= start_radius;
            } else {
                x += offset;
                y += start_radius;
            }
        }

        if (!isInBorders(x, y))
            continue;

        (*walkerLast)++;
        walkerX[*walkerLast] = x;
        walkerY[*walkerLast] = y;
    }
    for (int step = 0; step < 32; step++) {
        for (int i = 0; i <= *walkerLast; i++) {
            int type = simRand() % 8;
            int x = walkerX[i] + vector_x[type];
            int y = walkerY[i] + vector_y[type];
            int kill_radius = *max_radius + 24;

            if (!isInBorders(x, y) || calc_radius(x, y, *center_x, *center_y) > kill_radius) {
                killWalker(i, walkerLast, walkerX, walkerY);
                --i;
            } else {
                if (applyNearStatic(x, y, used, *center_x, *center_y, max_radius)) {
                    killWalker(i, walkerLast, walkerX, walkerY);
                    --i;
                } else {
                    walkerX[i] = x;
                    walkerY[i] = y;
                }
            }
        }
    }
}

void drawFrame(
    int walkerX[MAX_WALKER_TARGET],
    int walkerY[MAX_WALKER_TARGET],
    int walkerCnt,
    int used[SIM_Y_SIZE][SIM_X_SIZE]) {
    for (int y = 0; y < SIM_Y_SIZE; y++) {
        for (int x = 0; x < SIM_X_SIZE; x++) {
            int red = limitColor(20 + used[y][x] * 8);
            int green = limitColor(30 + used[y][x] * 3);
            int blue = limitColor(80 - used[y][x] * 2);
            if (used[y][x] == 0) {
                red = 0;
                green = 0;
                blue = 0;
            }

            int color = (int) 0xFF000000u | (red << 16) | (green << 8) | blue;
            simPutPixel(x, y, color);
        }
    }

    for (int i = 0; i <= walkerCnt; i++) {
        int x = walkerX[i];
        int y = walkerY[i];
        int red = 200;
        int green = 200;
        int blue = 200;

        int color = (int) 0xFF000000u | (red << 16) | (green << 8) | blue;
        simPutPixel(x, y, color);
    }
}

void app(void) {
    int used[SIM_Y_SIZE][SIM_X_SIZE] = {0};
    used[SIM_Y_SIZE / 2 + 1][SIM_X_SIZE / 2 + 1] = 1;
    int walkerX[MAX_WALKER_TARGET] = {0};
    int walkerY[MAX_WALKER_TARGET] = {0};
    int walkerLast = -1;
    int center_x = SIM_X_SIZE / 2 + 1;
    int center_y = SIM_Y_SIZE / 2 + 1;
    int max_radius = 0;

    while (1) {
        calculateFrame(walkerX, walkerY, &walkerLast, used, &center_x, &center_y, &max_radius);
        drawFrame(walkerX, walkerY, walkerLast, used);
        simFlush();
    }
}
