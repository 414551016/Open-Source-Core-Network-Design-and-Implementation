# 期中考重點複習總整

## 5G 核心網路（5GC）架構與五大類網路功能（NF）
5G 核心網採用服務化架構（[SBA,Service-Based Architecture，服務化架構](#何謂-sbaservice-based-architecture服務化架構)），主要網路功能（Network Function, NF）透過服務化介面（SBI）進行溝通：

五大類 NF 分類與功能對照
- 存取與行動性管理 (Access & Mobility)
  - AMF (Access and Mobility Management Function)：[負責 UE（User Equipment，使用者設備） 的註冊](#何謂-ue-註冊ue-registration)、連線與行動性管理，是進入 5GC 的主要入口。
- 會話與使用者面 (Session & User Plane)
  - SMF / UPF：負責 PDU Session 的建立、修改、釋放與數據流量轉送。
  > SMF（Session Management Function，會話管理功能，角色：指揮官） 是 5G Core 中負責管理 PDU Session（資料連線） 的控制平面網路功能。簡單來說：SMF 負責幫 UE 建立、修改及釋放上網連線。
  > <br>UPF（User Plane Function，使用者平面功能，角色：執行者） 是 5G Core 中負責實際轉送使用者資料的網路功能。簡單來說：UPF 是 5G 網路的資料轉送閘道器（Data Gateway）。
- 認證與訂閱 (Authentication & Subscription)
  <br>UE ↓ AMF ↓ AUSF ↓ UDM
  - AUSF / UDM：執行 UE 的安全認證流程與訂閱資料查詢。
    > AUSF（Authentication Server Function，認證伺服器功能）是 5G Core 中的認證伺服器功能，負責驗證 UE 的身分是否合法。當 UE 進行 Registration 時，AMF 會請求 AUSF 執行 5G-AKA 等認證程序，AUSF 再向 UDM 取得認證資料並完成驗證，以確保只有合法訂閱者能接入 5G 網路。
    > <br>專門負責：驗證 UE（使用者設備）是否為合法的網路使用者。

    > UDM（Unified Data Management，統一資料管理功能）為 5G Core 的統一資料管理功能，負責儲存與管理使用者訂閱資訊、身分識別資料及認證相關資訊。當 UE 進行註冊與認證時，AUSF 會向 UDM 取得認證資料，其他網路功能如 AMF、SMF、PCF 亦可向 UDM 查詢使用者相關資訊，因此 UDM 可視為 5G 核心網的使用者資料中心。
    是 5G Core（5GC）中的網路功能（NF），負責儲存與管理使用者的訂閱資料（Subscriber Data）。
    > <br>簡單來說：UDM 就是 5G 核心網的「用戶資料庫管理中心」。

    AUSF 與其他 NF 的關係
    |NF|功能|考試常見問法|與 4G EPC 的比較|
    |--|--|--|--|
    |AMF|接收註冊請求|「誰負責 UE 註冊管理？」|MME|
    |AUSF|執行使用者認證|「誰負責認證？」|HSS/MME 共同處理認證|
    |UDM|提供用戶資料|「誰儲存訂閱資料？」|HSS|
    |SMF|管理資料連線|
    |UPF|傳送用戶資料|

- 策略與計費 (Policy & Charging)
  - PCF / CHF：提供網路策略決策與計費數據統計回饋。
    > PCF（Policy Control Function，政策控制功能）為 5G Core 的政策控制功能，負責制定並提供 QoS、流量管理、網路切片及服務存取等政策規則。當 UE 建立 PDU Session 時，SMF 會向 PCF 查詢適用政策，再將這些規則套用至網路中。PCF 相當於 4G PCRF 的演進版本，負責 5G 網路的政策控制。

    > CHF（Charging Function，計費功能） 是 5G Core（5GC）中的網路功能（NF），負責收集與管理使用者的流量使用資訊，並提供計費依據。<br>簡單來說：CHF 就是 5G 網路中的「計費中心」，負責記錄誰用了多少網路資源，以及後續如何收費。
- 網路切片 (Network Slicing) 與基礎設施 (Infra)
  - NSSF：協助選擇適當的網路切片與路徑。
    <br>NSSF（Network Slice Selection Function，網路切片選擇功能） 是 5G Core（5GC）中的網路功能（NF），負責：協助 UE 選擇適合的 Network Slice（網路切片），並將流量導向對應的網路資源。<br>簡單來說：NSSF 是 5G 網路中的「切片分流員」，決定使用者應該進入哪一個 Network Slice。

  - NRF / UDR / NEF：分別負責服務發現（Service Discovery）、資料儲存與對外能力開放。
    > NRF（Network Repository Function，網路儲存庫功能） 是 5G Core（5GC）中的網路功能（NF），負責：提供網路功能（NF）的註冊（Registration）與發現（Discovery）服務。<br>簡單來說：NRF 就像 5G 核心網的「黃頁電話簿」或「服務登錄中心」，負責告訴其他 NF 該去哪裡找到所需的服務。

    > UDR（Unified Data Repository，統一資料儲存庫） 是 5G Core（5GC）中的資料儲存功能，負責：集中儲存使用者資料、訂閱資料、政策資料等資訊，供 UDM、PCF、CHF 等網路功能存取。

    > NEF（Network Exposure Function，網路能力曝光功能） 是 5G Core（5GC）中的網路功能（NF），負責：將 5G 網路內部的能力與資訊，以安全且受控的方式提供給外部應用程式（Application Function, AF）使用。<br>簡單來說：NEF 就像 5G 核心網的 API Gateway（API 閘道器），讓外部應用能合法、安全地使用網路能力。


## 5G 三大應場景
- eMBB（Enhanced Mobile Broadband，增強型行動寬頻）：4K/8K 串流、AR/VR、雲端遊戲
- URLLC（Ultra-Reliable Low-Latency Communications，超可靠低延遲通訊）：自動駕駛、遠端手術、工業控制
- mMTC（Massive Machine Type Communications，大規模機器型通訊）：海量 IoT、智慧電表、感測器

## 5GC 設計理念 — 三大方向
- SBA（SBA,Service-Based Architecture，服務化架構）：服務化架構，NF 拆分、HTTP/JSON互通
- CUPS（Control and User Plane Separation，控制平面與使用者平面分離）：控制面CP與使者面UP徹底分離，分開設計與部署的架構。
  - Control Plane（控制平面，CP）
  - User Plane（使用者平面，UP）
- 雲原生切片（Cloud-Native Network Slicing）：
  <br>雲原生切片（Cloud-Native Network Slicing） 是指將 Network Slicing（網路切片） 與 Cloud-Native（雲原生）技術 結合，使每個網路切片能夠像雲端服務一樣，獨立部署、擴充、管理與自動化運作。<br>簡單來說：將 5G 的 Network Slice 實作成一組可獨立運作的雲原生微服務。
  <br>雲原生切片的概念：Docker、Kubernetes (K8s)、Containers、Microservices、Service Mesh、將每個 Slice 建成獨立服務。
  <br>雲原生切片（Cloud-Native Network Slicing）是將 5G Network Slicing 與雲原生技術結合的架構，利用容器（Container）、微服務（Microservices）與 Kubernetes 等技術，將 AMF、SMF、UPF、PCF 等網路功能獨立部署於不同切片中。其特色包括自動化部署、彈性擴充、資源隔離與快速管理，可有效支援 eMBB、URLLC 與 mMTC 等不同應用需求。

### 何謂 SBA（Service-Based Architecture，服務化架構）？
SBA（Service-Based Architecture） 是 5G Core（5GC，5G 核心網路） 所採用的一種全新網路架構設計方式。它將核心網功能拆分成許多獨立的「網路功能（Network Functions, NFs）」，並透過標準化的 API 彼此溝通，就像雲端微服務（Microservices）一樣運作。
<br>簡單來說：SBA = 將傳統單體式核心網路，改造成許多可獨立部署、管理、擴充的服務。

5G SBA（服務化架構）將功能拆成許多網路功能（NF）。透過 RESTful API（HTTP/2）進行溝通。
- AMF
- SMF
- UPF
- UDM
- AUSF
- PCF
- NRF
- NSSF
- CHF
```
       +-----+   +-----+   +-----+   +-----+   +-----+   +-----+
       | CHF |   | UDR |   | AUSF|   | PCF |   | UDM |   | NEF |  ... (其他 NF)
       +--+--+   +--+--+   +--+--+   +--+--+   +--+--+   +--+--+
          |         |         |         |         |         |
=== SBI ======================================= (Service-Based Interface)
          |                   |                   |
       +--+--+             +--+--+             +--+--+
       | AMF |             | SMF |             | NRF |
       +--+--+             +--+--+             +-----+
         / \                  |
     N1 /   \ N2              | N4 (PFCP)
       /     \                |
    +--+     +---+   N3    +--+--+   N6    +----+
    |UE|-----|RAN|---------|UPF  |---------| DN |
    +--+     +---+         +-----+         +----+
```

### 何謂 UE 註冊（UE Registration）？
在 5G 網路中，UE（User Equipment，使用者設備）註冊是指：
<br>當手機、IoT 裝置或其他終端設備首次接入 5G 網路時，向核心網（5GC）報到並完成身分驗證的過程。
- 註冊的目的：讓 5G 核心網需要知道：
  - 你是誰？（身份認證）
  - 你有沒有合法訂閱？（Subscription）
  - 你目前在哪裡？（Location）
  - 應該使用哪個 Network Slice？
  - 應該套用哪些 QoS 與政策？

5G 註冊流程（簡化版）
- Step 1：UE 發送 Registration Request
  <br>手機開機後：UE → gNB → AMF
  <br>發送：Registration Request，內容包含：SUPI（使用者識別）、SUCI（加密後識別碼）、安全資訊
  > gNB（Next Generation Node B） 是 5G 基地台（5G Base Station） 的正式名稱，相當於 4G LTE 中的 eNB（eNodeB）。
- Step 2：AMF 尋找 AUSF
  <br>AMF 透過 SBA 向 NRF 查詢：AMF → NRF
  <br>詢問：誰提供 Authentication Service？NRF 回覆 AUSF 位址。
- Step 3：身份驗證
  <br>AMF 與 AUSF 互動：AMF → AUSF
  <br>AUSF 再向：UDM 取得使用者訂閱資料。
- Step 4：Authentication 成功
  <br>確認：SIM 卡合法、使用者合法、訂閱存在
- Step 5：更新位置資訊
  <br>AMF 通知 UDM：UE 目前位於某個 Tracking Area
  <br>因此核心網知道：UE Location
- Step 6：Registration Accept
  <br>AMF 回覆：Registration Accept 
  <br>給 UE。AMF → UE。表示：「你已成功註冊到 5G 網路」
  > 註冊只代表：核心網認識你了。若要真正傳輸資料，還需要建立：PDU Session

### 何謂 3GPP？
3GPP（3rd Generation Partnership Project，第三代合作夥伴計畫） 是全球最重要的行動通訊標準制定組織，負責制定：3G（UMTS）、4G（LTE）、5G（5G NR、5GC）、未來 6G 等行動通訊技術標準。<br>簡單來說：3GPP 就是制定全球行動通訊規格的國際標準組織。
<br>3GPP（3rd Generation Partnership Project，第三代合作夥伴計畫）是全球行動通訊標準制定組織，負責制定 3G、4G LTE 與 5G 等行動通訊技術規範。5G 核心網中的 SBA、AMF、SMF、UPF、Network Slicing 與 QoS 等架構皆由 3GPP 所定義，因此 3GPP 是全球行動通訊技術發展的重要標準制定機構。


### 何謂 5QI？
5QI（5G QoS Identifier）

### 何謂 AMF？
AMF（Access and Mobility Management Function，接取與移動性管理功能） 是 5G Core（5GC）中的核心控制平面網路功能，負責：管理 UE（使用者設備）接入 5G 網路、註冊、連線與移動性（Mobility）相關事務。當手機開機連上 5G 網路時，第一個接觸的核心網功能通常就是 AMF。
<br>AMF（Access and Mobility Management Function）是 5G Core 中的接取與移動性管理功能，負責 UE 註冊、NAS 訊號處理、認證流程協調、位置管理及換手（Handover）等工作。AMF 為 5G 核心網的主要入口控制功能，類似於 4G EPC 中的 MME。
```
AMF 在 5G 架構中的位置
UE
 │
gNB
 │
AMF
 ├── AUSF
 ├── UDM
 ├── SMF
 ├── NSSF
 └── PCF
```
- AMF 的主要功能
  - Registration Management（註冊管理）
  - Authentication 觸發
  - Mobility Management（移動性管理）
  - NAS（Non-Access Stratum） 訊號管理
  - Slice 選擇協調
  - 協助建立 PDU Session


### 何謂 AUSF？
AUSF（Authentication Server Function，認證伺服器功能）是 5G Core 中的認證伺服器功能，負責驗證 UE 的身分是否合法。當 UE 進行 Registration 時，AMF 會請求 AUSF 執行 5G-AKA 等認證程序，AUSF 再向 UDM 取得認證資料並完成驗證，以確保只有合法訂閱者能接入 5G 網路。

### 何謂 CHF？
CHF（Charging Function，計費功能） 是 5G Core（5GC）中的網路功能（NF），負責收集與管理使用者的流量使用資訊，並提供計費依據。<br>簡單來說：CHF 就是 5G 網路中的「計費中心」，負責記錄誰用了多少網路資源，以及後續如何收費。
<br>CHF（Charging Function，計費功能）是 5G Core 的計費功能，負責收集使用者流量與服務使用資訊，支援線上（Online）與離線（Offline）計費。CHF 可與 SMF、UPF 及 PCF 協同運作，提供帳單產生、額度管理及計費控制等功能，是 5G 核心網的計費中心。
- CHF 的主要功能：
  - 流量計費、流量統計
  - 即時計費（Online Charging）
  - 離線計費（Offline Charging）
  - 提供配額控制

### 何謂 CUPS？
CUPS（Control and User Plane Separation）是將控制平面與使用者平面分離的網路架構設計。控制平面負責認證、註冊、Session 管理等訊號控制功能，而使用者平面負責實際資料封包轉送。在 5G Core 中，SMF 屬於控制平面，UPF 屬於使用者平面，兩者透過 PFCP 協定互動。CUPS 可提升網路擴充性、彈性及邊緣運算部署能力。

### 何謂 eMBB？
eMBB（Enhanced Mobile Broadband，增強型行動寬頻） 是 3GPP 定義的 5G 三大應用場景之一，主要目標是：提供比 4G 更高的傳輸速率、更大的容量與更好的使用者體驗。
<br>eMBB（Enhanced Mobile Broadband，增強型行動寬頻）是 5G 的三大應用場景之一，主要提供高速率、大容量的無線寬頻服務，以滿足 4K/8K 影音串流、VR/AR、雲端遊戲及高速行動上網等需求。其特色為高頻寬與高吞吐量，是目前智慧型手機最常見的 5G 應用場景。
- 5G 的三大應用場景為：
  - eMBB（Enhanced Mobile Broadband，增強型行動寬頻）：高頻寬、高速率
  - URLLC（Ultra-Reliable Low-Latency Communications）：超低延遲、高可靠
  - mMTC（Massive Machine Type Communications）：大量物聯網連線
- eMBB 的主要特性
  - 高資料傳輸速率
  - 更大網路容量
  - 更佳使用者體驗


### 何謂 gNB？
gNB（Next Generation Node B） 是 5G 基地台（5G Base Station） 的正式名稱，相當於 4G LTE 中的 eNB（eNodeB）。

### 何謂 NEF？
NEF（Network Exposure Function，網路能力曝光功能） 是 5G Core（5GC）中的網路功能（NF），負責：將 5G 網路內部的能力與資訊，以安全且受控的方式提供給外部應用程式（Application Function, AF）使用。<br>簡單來說：NEF 就像 5G 核心網的 API Gateway（API 閘道器），讓外部應用能合法、安全地使用網路能力。
<br>NEF（Network Exposure Function，網路能力曝光功能）是 5G Core 的網路能力曝光功能，負責以安全且標準化的 API 方式，向外部應用（AF）提供 5G 網路能力與資訊，例如位置服務、事件通知、QoS 請求及網路分析資訊。NEF 扮演 5G 核心網與外部應用之間的橋樑，可視為 5G SBA 架構中的 API Gateway。
- NEF 的主要功能
  - Network Capability Exposure 提供網路能力給第三方使用。例如：位置服務、QoS請求
  - API Gateway：NEF 提供標準 REST API：外部應用透過 API 存取網路能力。
  - 安全與授權：NEF 負責：身分驗證、權限控管、API授權、資料過濾
  - 事件通知：外部應用可訂閱事件。
- NEF 與 PCF 的關係：
  - NEF 對外提供API
  - PCF 制定QoS政策

### 何謂 NRF？
NRF（Network Repository Function，網路儲存庫功能） 是 5G Core（5GC）中的網路功能（NF），負責：提供網路功能（NF）的註冊（Registration）與發現（Discovery）服務。<br>簡單來說：NRF 就像 5G 核心網的「黃頁電話簿」或「服務登錄中心」，負責告訴其他 NF 該去哪裡找到所需的服務。
<br>NRF（Network Repository Function，網路儲存庫功能）是 5G Core 中負責網路功能註冊與服務發現的網路功能。各 NF（如 AMF、SMF、AUSF、UDM）會先向 NRF 註冊自身服務，當其他 NF 需要特定服務時，可向 NRF 查詢並取得對應 NF 的位址資訊。NRF 類似 SBA 架構中的服務登錄中心，是實現 5G Core 服務化架構的重要元件。
- NRF 的主要功能：
  - NF Registration（服務註冊）
  - NF Discovery（服務發現）
  - 狀態管理
- NRF 與 DNS 概念非常類似。

### 何謂 mMTC？
mMTC（Massive Machine Type Communications，大規模機器型通訊） 是 3GPP 定義的 5G 三大應用場景之一，主要目標是：支援海量 IoT（物聯網）裝置同時連接到網路。
<br>mMTC（Massive Machine Type Communications，大規模機器型通訊）是 5G 三大應用場景之一，主要支援大量物聯網設備同時接入網路。其特色為高連線密度、低功耗及小量資料傳輸，適用於智慧城市、智慧電網、智慧農業及各類 IoT 感測器應用，目標可支援每平方公里百萬級設備連線。
- 為什麼需要 mMTC？
  - 未來智慧城市中會有大量設備連網，例如：智慧電表、溫濕度感測器、停車感測器、路燈控制器、農業感測器、水表與瓦斯表。假設一個智慧城市有：100萬個 IoT 感測器，若使用傳統行動網路，基地台可能無法同時支援如此大量的連線。因此 5G 提出 mMTC。
  - mMTC 的應用範例：
    - 智慧城市：停車位感測器、智慧路燈、空氣品質監測、垃圾桶監測
    - 智慧農業：土壤濕度、溫度感測器、灌溉控制器。分布範圍廣且數量多。
    - 智慧電網：智慧電表、智慧水表、智慧瓦斯表。需要大量設備定期回傳資料。
    - 工業物聯網：設備狀態監測、震動感測器、故障預警系統。通常資料量不大，但設備數量眾多。
- mMTC 的主要特性：
  - 支援大量裝置：3GPP 目標：每平方公里 100 萬台設備
  - 低功耗：許多 IoT 裝置靠電池運作，希望：數年不用換電池。因此 mMTC 強調：低耗電、長待機時間。
  - 小量資料傳輸：mMTC 不追求高速率。例如溫度感測器每分鐘傳送，只有幾個 Bytes。


### 何謂 NSSF？
NSSF（Network Slice Selection Function，網路切片選擇功能） 是 5G Core（5GC）中的網路功能（NF），負責：協助 UE 選擇適合的 Network Slice（網路切片），並將流量導向對應的網路資源。<br>簡單來說：NSSF 是 5G 網路中的「切片分流員」，決定使用者應該進入哪一個 Network Slice。
<br>NSSF（Network Slice Selection Function，網路切片選擇功能）是 5G Core 的網路切片選擇功能，負責根據使用者訂閱資訊與網路政策選擇適合的 Network Slice，並回覆允許的 S-NSSAI（Allowed NSSAI）給 AMF。NSSF 是實現 5G Network Slicing 的核心網路功能，可讓不同應用（如 eMBB、URLLC、mMTC）使用不同的邏輯網路資源。

### 何謂 PCF？

### 何謂 PDU？
PDU（Protocol Data Unit，協定資料單元） 是網路通訊中傳輸的資料單位。<br>簡單來說：PDU 就是在網路各層之間傳遞的資料封包。它代表：UE 與資料網路（Data Network）之間的一條邏輯資料連線。

### 何謂 QoS？
QoS（Quality of Service，服務品質） 是網路用來控制與保證不同類型流量傳輸品質的機制。
<br>簡單來說：QoS 決定哪些資料優先傳送、能使用多少頻寬，以及允許多大的延遲與封包遺失率。
<br>是網路用來保證特定流量傳輸品質的機制，可控制頻寬、延遲、封包遺失率及優先權等特性。在 5G 網路中，PCF 負責制定 QoS 政策，SMF 建立 QoS Flow，UPF 執行相關規則，並透過 5QI（5G QoS Identifier）區分不同服務的品質需求，以滿足語音、影音串流、工業控制等不同應用場景。

|名稱|功能|
|--|--|
|QoS|定義服務品質需求|
|PCF|制定 QoS 政策|
|SMF|建立 QoS Flow|
|UPF|執行 QoS 規則|
|5QI|QoS 等級識別碼|


### 何謂 UDR？
UDR（Unified Data Repository，統一資料儲存庫） 是 5G Core（5GC）中的資料儲存功能，負責：集中儲存使用者資料、訂閱資料、政策資料等資訊，供 UDM、PCF、CHF 等網路功能存取。<br>簡單來說：UDR 就像 5G 核心網的「資料庫」，而 UDM 則像是管理這個資料庫的管理員。
<br>UDR（Unified Data Repository，統一資料儲存庫）是 5G Core 的統一資料儲存庫，負責集中儲存使用者訂閱資料、認證資料、QoS 政策與計費相關資訊。UDR 提供資料給 UDM、PCF、CHF 等網路功能使用，而 UDM 則負責管理與存取這些資料。UDR 與 UDM 的關係類似於資料庫與資料管理服務，是 5G SBA 架構中的核心資料層元件。

### 何謂 UPF？
SMF / UPF：負責 PDU Session 的建立、修改、釋放與數據流量轉送。
<br>UPF（User Plane Function，使用者平面功能，角色：執行者） 是 5G Core 中負責實際轉送使用者資料的網路功能。簡單來說：UPF 是 5G 網路的資料轉送閘道器（Data Gateway）。

### 何謂 URLLC？
URLLC（Ultra-Reliable Low-Latency Communications，超可靠低延遲通訊） 是 3GPP 定義的 5G 三大應用場景之一，主要目標是：提供極低延遲（Low Latency）與極高可靠度（High Reliability）的通訊服務。
<br>URLLC（Ultra-Reliable Low-Latency Communications，超可靠低延遲通訊）是 5G 的三大應用場景之一，強調極低延遲與極高可靠度，可提供毫秒等級的通訊延遲及 99.999% 以上的傳輸可靠度，適用於自駕車、智慧工廠、遠端醫療及工業控制等關鍵任務應用。
- URLLC 的兩大核心特性：
  - Ultra-Low Latency（超低延遲）
  - Ultra-Reliability（超高可靠度）
- URLLC 的應用場景
  - 自駕車（V2X）
  - 智慧工廠
  - 遠端醫療
  - 電力與關鍵基礎設施
  

### 何謂 RAN？
RAN（Radio Access Network，無線接取網路） 是行動通訊系統中，負責讓 UE（User Equipment）透過無線電訊號連接到核心網路（Core Network） 的部分。<br>簡單來說：RAN 就是手機與基地台之間的無線網路系統。
<br>RAN（Radio Access Network，無線接取網路）是行動通訊系統中負責 UE 與核心網路之間無線連線的部分。在 5G 中，RAN 主要由 gNB（5G基地台）組成，負責無線資源管理、資料傳輸、接入控制及移動性管理，提供 UE 存取 5G 核心網（5GC）的能力。

- RAN 的主要功能：
  - 提供無線連線：讓 UE 能透過 5G NR（New Radio）連入網路。
  - 無線資源管理（RRM）：RAN 必須管理：頻譜（Spectrum）、頻寬（Bandwidth）、Resource Blocks、發射功率
  - 資料傳輸：控制訊號：UE ↔ AMF 與使用者資料：UE ↔ Internet都需經過 RAN。
  - Mobility（移動性管理）

### 何謂 SMF？
SMF / UPF：負責 PDU Session 的建立、修改、釋放與數據流量轉送。
<br>SMF（Session Management Function，會話管理功能，角色：指揮官） 是 5G Core 中負責管理 PDU Session（資料連線） 的控制平面網路功能。簡單來說：SMF 負責幫 UE 建立、修改及釋放上網連線。
  > <br>UPF（User Plane Function，使用者平面功能，角色：執行者） 是 5G Core 中負責實際轉送使用者資料的網路功能。簡單來說：UPF 是 5G 網路的資料轉送閘道器（Data Gateway）。


