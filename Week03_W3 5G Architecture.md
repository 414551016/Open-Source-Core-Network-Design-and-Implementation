
Prompt：請說明本教學重點內容，及你的看法與總結
- 教學資源：[{W3 5G Architecture}](https://cndi-free5gc.github.io/doc-slide/slides/W3%205G%20Architecture.pdf) [[W3 5G Architecture]](https://github.com/414551016/Open-Source-Core-Network-Design-and-Implementation/blob/main/Lecture/Week03_W3%205G%20Architecture.pdf)
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

這張簡報的重點為 AS（Access Stratum）與 NAS（Non-Access Stratum）兩層控制訊令（Control Signaling）的比較與架構解構。
- 本教學重點內容
  - 核心概念：5G 網路將 UE（用戶設備）發出的控制訊令劃分為 AS 與 NAS 兩個不同層級，各自有明確的分工與終止節點（Termination Point）。
  - AS（Access Stratum，存取層）：
    -  對象與範圍：UE 與 RAN（無線存取網，即 gNB 基站）之間的無線資源控制訊令。
    -  典型範例：如 RRC（Radio Resource Control）連線建立、無線資源配置與實體層參數設定。
    -  終止點：訊令到達 gNB（基站）即告終止，5G 核心網（5GC）完全看不到也不會處理這部分的細節。
  - NAS（Non-Access Stratum，非存取層）：
    - 對象與範圍：UE 與 5GC（核心網）之間的高層控制訊令。
    - 典型範例：如 Registration（註冊）、PDU Session 建立請求（資料通道建立）等。
    - 終止點：RAN（基站）僅扮演透明傳輸角色（原封不動地將封包轉送），訊令最終在核心網的 AMF 終止與解析。
  - 架構意義：<br>正是因為「UE 無法直接透過物理線路接觸核心網」，才需要靠 RAN 進行中間轉送，這也成為後續劃分 N1（UE 與 AMF 間的邏輯介面） 與 N2（RAN 與 AMF 間的實體/網路介面） 的根本由來。
- 個人看法與總結


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

這張簡報的重點為 5G 核心網中建立數據傳輸管道的「PDU Session 建立程序（Establishment Procedure）」與其運作流程。
- 本教學重點內容
  - 核心定義：<br>PDU Session 是 UE（用戶設備）與 DN（Data Network，外部資料網路）之間的一條邏輯連線。其功能等同於 4G LTE 架構中的 Bearer（承載），是使用者實際上網傳輸資料的通道。
  - 建置程序四步驟：
    - 步驟 1：建立請求發送（UE $\rightarrow$ RAN $\rightarrow$ AMF）<br>UE 發出 NAS 層的 Establishment Request，經由 RAN（gNB）透過 N2 介面原封不動轉送（N2 Forward）給 AMF。
    - 步驟 2：情境建立與策略決策（AMF $\rightarrow$ SMF）<br>AMF 將請求轉交給專門處理工作階段的 SMF（Create SM Context）。SMF 接手後進行決策，包含選擇合適的 UPF、對應的 DN 以及配置 QoS（服務品質） 參數。
    - 步驟 3：轉送規則設定（SMF $\rightarrow$ UPF）<br>SMF 透過 N4 介面向 UPF 下達指令，下發並建立資料封包的轉送規則（建立轉送規則）。
    - 步驟 4：使用者面管道建立（RAN $\leftrightarrow$ UPF）<br>完成設定後，RAN 與 UPF 之間建立起 N3 GTP-U Tunnel（使用者面隧道），讓真正的數據流量可以在 UE 與外部網路之間高速傳輸。
- 個人看法與總結
  - 控制面與用戶面的極致分離（CUPS）：<br>這張圖非常直觀地呈現了 5G 的 CUPS（Control and User Plane Separation）架構。控制面的信令由 AMF 與 SMF 互相協調並下達決策（步驟 1～3），而實際承載高頻寬流量的「使用者面（步驟 4）」則直接穿過 RAN 與 UPF，完全不經過 AMF/SMF，極大地減輕了控制面元件的負載。
  - 4G 與 5G 的演進對照：<br>簡報標註「對應 4G 的 Bearer」，點出了概念上的繼承與變革。4G 是以管道（Bearer）為單位的硬性連接，而 5G 採用 PDU Session，能更彈性地根據 QoS Flow 進行細粒度的流量管理與網路切片（Network Slicing）對應。
  - 整體總結：<br>本頁簡報是將前面章節提到的各個 NF（AMF、SMF、UPF）與控制層（NAS/AS）融合起來的「實戰觀念圖」。掌握了 PDU Session 的建立順序，就掌握了 5G 端到端資料傳輸的骨幹脈絡。

## slide：29
<div align="left" >
  <img src="./Lecture/Week03/W3 5G Architecture_page-0029.jpg" width="50%">
</div>

這張簡報的重點為 5G 網路中的切換（Handover）基本概念與運作機制。
- 本教學重點內容
  - 核心概念：當 UE（用戶設備）移動到新的基地台涵蓋範圍時，5G 網路必須進行 Handover 流程，以確保通訊不中斷（Seamless Connectivity）。
  - 關鍵運作步驟：
  - 步驟 1：準備切換（UE $\leftrightarrow$ 新 gNB）<br>當 UE 離舊基地台（舊 gNB）漸遠、靠近新基地台（新 gNB）時，觸發無線資源與切換準備程序。
  - 步驟 2：更新位置與使用者面路徑（核心網 AMF/UPF）<br>控制面與使用者面的路徑隨之切換：
    - 控制面遷移：更新 UE 的位置資訊（由 AMF 處理）。
    - 使用者面路徑切換：原本由「核心網 $\leftrightarrow$ 舊 gNB」的數據流量路徑，重新導向建立為「核心網 $\leftrightarrow$ 新 gNB」的新路徑（由 UPF 處理）。
  - 關鍵目的：<br>核心網路必須同時完成控制面遷移與使用者面路徑切換，連線才不會在中斷或掉封包的情況下順利過渡。
- 個人看法與總結
  - 控制面與使用者面的協同作戰：<br>切換（Handover）最考驗核心網與無線存取網（RAN）之間的同步協調。圖中將 AMF（控制面）與 UPF（使用者面）並列在核心網端，說明了切換不僅僅是無線訊號轉移（AS 層），更需要核心網在中樞完成路徑更新（NAS/NGAP 層）。
  - 確保使用者體驗（QoS）的關鍵：<br>對於即時性高的應用（如車聯網、影音串流、線上遊戲），Handover 過程中的毫秒級延遲或封包遺失都會造成卡頓。因此，如何縮短「舊路徑切斷」與「新路徑建立」之間的時間差，是 5G 網路優化的重中之重。
  - 整體總結：<br>本頁簡報為 5G 行動性管理（Mobility Management）提供了非常簡潔直觀的概念模型。綜合前面幾頁（從 NF 介紹、AS/NAS 區分到 PDU Session 建立），本頁展示了當用戶在動態移動狀況下，5G 架構如何彈性調整與維持服務不中斷的能力。


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









