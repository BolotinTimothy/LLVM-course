from collections import Counter, deque
import csv
import sys

trace_path = sys.argv[1]
stats_path = sys.argv[2]
window_len = int(sys.argv[3])

counts = Counter()
window = deque(maxlen=window_len)
events = 0
with open(trace_path, encoding="utf-8") as trace:
    for line in trace:
        window.append(line.strip())
        if len(window) == window_len:
            counts[tuple(window)] += 1
            events += 1

with open(stats_path, "w", newline="", encoding="utf-8") as output:
    writer = csv.writer(output)
    writer.writerow(["rank", "count", "percent", "pattern"])
    for rank, (pattern, count) in enumerate(
            counts.most_common(20), start=1
    ):
        percent = 100 * count / events
        writer.writerow([
            rank,
            count,
            f"{percent:.4f}",
            " | ".join(pattern),
        ])
