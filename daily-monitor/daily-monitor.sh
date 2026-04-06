#!/bin/bash
# 每日監控腳本 - 簡潔版
# 執行時間: $(date '+%Y-%m-%d %H:%M:%S %Z')

STATE_DIR="/root/.openclaw/workspace/monitor-state"
LOG_FILE="$STATE_DIR/daily-$(date +%Y%m%d).log"

mkdir -p "$STATE_DIR"

echo "=== Daily Monitor Start: $(date) ===" >> "$LOG_FILE"

# 1. 政府採購監控
echo "[$(date +%H:%M:%S)] Checking procurement..." >> "$LOG_FILE"
if bash /root/.openclaw/workspace/monitor-procurement-v2.sh >> "$LOG_FILE" 2>&1; then
    echo "[$(date +%H:%M:%S)] ✅ Procurement check done" >> "$LOG_FILE"
else
    echo "[$(date +%H:%M:%S)] ❌ Procurement check failed" >> "$LOG_FILE"
fi

# 2. 檢查是否有新內容
NEW_CONTENT=0
if [ -f "$STATE_DIR/has-procurement-update" ]; then
    echo "[$(date +%H:%M:%S)] 📤 New procurement found" >> "$LOG_FILE"
    NEW_CONTENT=$((NEW_CONTENT + 1))
    rm -f "$STATE_DIR/has-procurement-update"
fi

# 3. 嘉義平台說明
echo "" >> "$LOG_FILE"
echo "[$(date +%H:%M:%S)] Chiayi platform: requires manual browser check" >> "$LOG_FILE"

# 摘要輸出
echo "=== Summary ===" >> "$LOG_FILE"
echo "Time: $(date)" >> "$LOG_FILE"
echo "New items: $NEW_CONTENT" >> "$LOG_FILE"
echo "Log: $LOG_FILE" >> "$LOG_FILE"
echo "=== End ===" >> "$LOG_FILE"

# 回傳摘要到 stdout
echo "Daily monitor completed at $(date)"
echo "New items found: $NEW_CONTENT"
echo "Full log: $LOG_FILE"
