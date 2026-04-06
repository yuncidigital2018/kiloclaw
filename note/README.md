# NTOU NDC Facebook 貼文記錄

## 來源
- **粉專名稱**：國立臺灣海洋大學 (NTOU NDC)
- **網址**：https://www.facebook.com/ntou.ndc/
- **目標範圍**：2025 年至最新貼文

## ⚠️ 資料收集狀態

**自動抓取限制：**
Facebook 有嚴格的反爬蟲機制，未登入無法抓取貼文內容。需要以下方式之一取得資料：

### 方案 1：Facebook 官方匯出（推薦）
1. 登入 Facebook
2. 前往 https://www.facebook.com/dyi/
3. 選擇「你的貼文」或「特定粉專資料」
4. 匯出為 JSON 或 HTML 格式
5. 上傳檔案，我將轉換為 Markdown

### 方案 2：手動複製
- 複製 2025 年以來的重要貼文文字
- 發送到 Telegram，我將依日期整理

### 方案 3：使用 Facebook Graph API（需申請）
- 需申請 Facebook Developer 帳號
- 取得 Access Token
- 我可以用 API 抓取公開貼文

## 📁 資料結構規劃

```
note/
├── 2025/
│   ├── 2025-01.md  # 一月貼文彙整
│   ├── 2025-02.md  # 二月貼文彙整
│   └── ...
├── 2026/
│   ├── 2026-01.md
│   └── ...
└── index.md        # 總目錄
```

## 📝 格式範例

```markdown
## 2025-04-06

**標題**：活動公告
**來源**：Facebook
**連結**：https://facebook.com/...

內容文字...

---

## 2025-04-05

...
```

---

**等待資料來源中...**
