
Prompt：請說明本教學重點內容，及你的看法與總結
- 教學資源：[W3 5G Architecture](https://cndi-free5gc.github.io/doc-slide/slides/W3%205G%20Architecture.pdf)
### Week 3 課堂逐字稿
## slide：1 -2
<div align="left" >
  <img src="./Lecture/Week03/W3 5G Architecture_page-0001.jpg" width="49%">
  <img src="./Lecture/Week03/W3 5G Architecture_page-0002.jpg" width="49%">
</div>

## slide：3
<div align="left" >
  <img src="./Lecture/Week03/W3 5G Architecture_page-0003.jpg" width="50%">
</div>

## slide：4
<div align="left" >
  <img src="./Lecture/Week03/W3 5G Architecture_page-0004.jpg" width="50%">
</div>

## slide：5
<div align="left" >
  <img src="./Lecture/Week03/W3 5G Architecture_page-0005.jpg" width="50%">
</div>

## slide：6
<div align="left" >
  <img src="./Lecture/Week03/W3 5G Architecture_page-0003.jpg" width="50%">
</div>

## slide：7
<div align="left" >
  <img src="./Lecture/Week03/W3 5G Architecture_page-0003.jpg" width="50%">
</div>

## slide：8
<div align="left" >
  <img src="./Lecture/Week03/W3 5G Architecture_page-0003.jpg" width="50%">
</div>

## slide：9
<div align="left" >
  <img src="./Lecture/Week03/W3 5G Architecture_page-0003.jpg" width="50%">
</div>

## slide：10
<div align="left" >
  <img src="./Lecture/Week03/W3 5G Architecture_page-0003.jpg" width="50%">
</div>

## slide：11
<div align="left" >
  <img src="./Lecture/Week03/W3 5G Architecture_page-0003.jpg" width="50%">
</div>

## slide：12
<div align="left" >
  <img src="./Lecture/Week03/W3 5G Architecture_page-0003.jpg" width="50%">
</div>

## slide：13
<div align="left" >
  <img src="./Lecture/Week03/W3 5G Architecture_page-0003.jpg" width="50%">
</div>

## slide：14
<div align="left" >
  <img src="./Lecture/Week03/W3 5G Architecture_page-0003.jpg" width="50%">
</div>

## slide：15
<div align="left" >
  <img src="./Lecture/Week03/W3 5G Architecture_page-0003.jpg" width="50%">
</div>

## slide：16
<div align="left" >
  <img src="./Lecture/Week03/W3 5G Architecture_page-0003.jpg" width="50%">
</div>

## slide：17
<div align="left" >
  <img src="./Lecture/Week03/W3 5G Architecture_page-0003.jpg" width="50%">
</div>

## slide：18
<div align="left" >
  <img src="./Lecture/Week03/W3 5G Architecture_page-0003.jpg" width="50%">
</div>

## slide：19
<div align="left" >
  <img src="./Lecture/Week03/W3 5G Architecture_page-0003.jpg" width="50%">
</div>

## slide：20
<div align="left" >
  <img src="./Lecture/Week03/W3 5G Architecture_page-0003.jpg" width="50%">
</div>

## slide：21
<div align="left" >
  <img src="./Lecture/Week03/W3 5G Architecture_page-0021.jpg" width="50%">
</div>

這張簡報的重點為 5G 核心網（5GC）中的網路功能（Network Function, NF）。
- 本教學重點內容
  - 核心概念：介紹 5G 核心網路（5GC）架構中所定義的主要網路元件與功能（NF），後續章節將對每個角色進行詳細說明。
  - 主要網路功能（NF）列表：
    - AMF（Access and Mobility Management Function）：存取與行動性管理功能，負責處理裝置註冊、連線與移動管理。
    - SMF（Session Management Function）：工作階段管理功能，負責建立、維護與管理用戶的資料傳輸管道。
    - UPF（User Plane Function）：用戶面功能，負責傳送與處理實際的數據流量包。
    - UDM（Unified Data Management）：統一數據管理，負責用戶數據與訂閱資訊的管理。
    - UDR（Unified Data Repository）：統一數據儲存庫，儲存用戶資料與策略數據。
    - PCF（Policy Control Function）：策略控制功能，提供網路策略管理規則。
    - AUSF（Authentication Server Function）：認證伺服器功能，負責處理用戶安全認證。
    - CHF（Charging Function）：計費功能，處理網路計費與用量統計。
    - NRF（NF Repository Function）：網路功能儲存庫，負責 5GC 內各個 NF 的服務發現與註冊。
    - NSSF（Network Slice Selection Function）：網路切片選擇功能，負責引導用戶連接至適當的網路切片。
  - 補充說明：<br>投影片特別註記 WebConsole 是開源專案 free5GC 提供用於監控與管理的網頁介面，並非 3GPP 標準規範中定義的 NF。
- 個人看法與總結
  - 模組化與微服務架構：這張簡報清楚展現了 5G 核心網採用「基於服務的架構」（SBA, Service-Based Architecture）的特性。相較於 4G LTE 的實體網元（如 MME、SGW、PGW），5G 將網路功能拆解為更細緻、可獨立擴充與部署的微服務（NF）。
  - 實作與標準的區分：簡報下方的補充說明非常關鍵。在學習開源核心網（如 free5GC）時，理解哪些元件屬於國際標準規範（3GPP）、哪些屬於系統實作配套（如 WebConsole），有助於釐清理論架構與實際維運工具之間的差異。
  - 整體總結：本頁投影片旨在為學員建立 5GC 內部各主幹元件的總覽地圖，是進入 5G 核心網控制面（Control Plane）與用戶面（User Plane）運作機制前的重要基礎。



## slide：22
<div align="left" >
  <img src="./Lecture/Week03/W3 5G Architecture_page-0022.jpg" width="50%">
</div>

## slide：23
<div align="left" >
  <img src="./Lecture/Week03/W3 5G Architecture_page-0023.jpg" width="50%">
</div>

## slide：24
<div align="left" >
  <img src="./Lecture/Week03/W3 5G Architecture_page-0024.jpg" width="50%">
</div>

## slide：25
<div align="left" >
  <img src="./Lecture/Week03/W3 5G Architecture_page-0025.jpg" width="50%">
</div>

## slide：26
<div align="left" >
  <img src="./Lecture/Week03/W3 5G Architecture_page-0026.jpg" width="50%">
</div>

## slide：27
<div align="left" >
  <img src="./Lecture/Week03/W3 5G Architecture_page-0027.jpg" width="50%">
</div>

## slide：28
<div align="left" >
  <img src="./Lecture/Week03/W3 5G Architecture_page-0028.jpg" width="50%">
</div>

## slide：29
<div align="left" >
  <img src="./Lecture/Week03/W3 5G Architecture_page-0029.jpg" width="50%">
</div>

## slide：30
<div align="left" >
  <img src="./Lecture/Week03/W3 5G Architecture_page-0030.jpg" width="50%">
</div>

## slide：31
<div align="left" >
  <img src="./Lecture/Week03/W3 5G Architecture_page-0003.jpg" width="50%">
</div>

## slide：32
<div align="left" >
  <img src="./Lecture/Week03/W3 5G Architecture_page-0003.jpg" width="50%">
</div>

## slide：33
<div align="left" >
  <img src="./Lecture/Week03/W3 5G Architecture_page-0003.jpg" width="50%">
</div>


## slide：34
<div align="left" >
  <img src="./Lecture/Week03/W3 5G Architecture_page-0003.jpg" width="50%">
</div>









