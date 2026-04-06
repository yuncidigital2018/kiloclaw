#!/bin/bash
# 自動同步腳本 - 將工作區檔案同步到 GitHub

cd /root/kiloclaw || exit 1

echo "🔄 開始同步檔案..."
date

# 複製最新檔案
echo "📁 複製 Accupass 課程資料..."
cp -u /root/.openclaw/workspace/accupass_courses.md accupass-courses/ 2>/dev/null

echo "📁 複製國本學堂資料..."
cp -u /root/.openclaw/workspace/guoben_courses_*.md guoben-academy/ 2>/dev/null
cp -u /root/.openclaw/workspace/guoben_courses_detail.json guoben-academy/ 2>/dev/null

echo "📁 複製監控腳本..."
cp -u /root/.openclaw/workspace/daily-monitor.sh daily-monitor/ 2>/dev/null

echo "📁 複製其他 MD 檔案..."
for file in /root/.openclaw/workspace/*.md; do
    if [ -f "$file" ]; then
        cp -u "$file" system-configs/ 2>/dev/null
    fi
done

# Git 操作
echo "📤 推送到 GitHub..."
git add -A
git commit -m "Auto sync: $(date '+%Y-%m-%d %H:%M:%S')" 2>/dev/null || echo "沒有變更"
git push origin main

echo "✅ 同步完成！"
