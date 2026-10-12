# Practice 2 - NF Writing
學生：劉順松 414551016

本學期教材整理各個 NF 的用途，每個角色以簡述內容接摘要說明，方便之後閱讀 free5GC 程式碼與回顧流程。

## 1. AMF - Access and Mobility Management Function（存取與行動性管理功能）

AMF 是 UE 進入核心網路的控制面窗口，負責註冊、註銷、位置追蹤、連線狀態、尋呼與切換協調，並與 AUSF、UDM 配合完成鑑權及 NAS 安全設定。NAS-MM 由 AMF 處理，NAS-SM 則經 AMF 轉交選出的 SMF；我把它理解成負責接入與協調的前台，實際上網封包不經過它。

## 2. SMF - Session Management Function（會話管理功能）

SMF 負責 PDU Session 的建立、修改與釋放、UE IP 分配，以及 UPF 與資料路徑的選擇。它取得 UDM 的訂閱資料與 PCF 的策略後，透過 N4／PFCP 將封包比對、轉送、QoS 與用量回報規則下發給 UPF，是課堂所說的「路網規劃中心」。

## 3. UPF - User Plane Function（使用者面功能）

UPF 依 SMF 的規則處理真正的使用者封包：PDR 比對流量、FAR 決定轉送或緩衝、QER 處理 QoS、URR 統計用量並回報。它透過 N3 連接 RAN、N6 連接 DN、N9 連接其他 UPF，也能作為 ULCL 的分流點；free5GC 的 go-upf 處理 PFCP，資料轉送則由 Linux 核心中的 gtp5g 執行。

## 4. UDM - Unified Data Management（統一資料管理）

UDM 管理使用者識別、訂閱與服務授權相關資訊，提供 AMF 所需的接入訂閱及 SMF 所需的會話訂閱，也配合 AUSF 提供認證資料。它還能登記目前服務 UE 的 AMF／SMF；我把 UDM 理解成處理訂閱資料的管理邏輯，底層資料則向 UDR 取得。

## 5. UDR - Unified Data Repository（統一資料儲存庫）

UDR 提供訂閱、政策及應用相關資料的儲存與讀寫服務，供 UDM、PCF 等 NF 使用。W6 的 Traffic Influence 範例會把 influenceData 寫入 UDR，再通知 PCF 資料已變更；UDR 負責保存與通知，選路仍由 SMF 處理。

## 6. PCF - Policy Control Function（策略控制功能）

PCF 根據訂閱資訊與服務需求，提供接入、行動性及會話相關的策略，例如 QoS 與計費控制規則。以 W6 的流程來說，PCF 提供 PCC rules，SMF 再轉成 UPF 可執行的規則；Traffic Influence 資料變更時，PCF 也會通知 SMF 更新策略。

## 7. AUSF - Authentication Server Function（認證伺服器功能）

AUSF 負責使用者認證，與 UDM 配合取得認證資料，支援 5G-AKA／EAP-AKA' 等方法。AMF 在 UE 註冊時呼叫 AUSF 的服務，以確認身分並建立後續安全保護所需的基礎；它與 AMF 的接入管理、UDM 的訂閱管理各有分工。

## 8. CHF - Charging Function（計費功能）

CHF 處理服務使用量與計費資訊，支援線上額度管理及離線計費紀錄。資料會話中，UPF 依 URR 統計用量並回報 SMF，再由 SMF 與 CHF 交換計費資訊，因此轉送、用量蒐集與計費處理是分開合作的。

## 9. NRF - NF Repository Function（網路功能儲存庫功能）

NRF 提供 NF 的服務註冊與發現，記錄各 NF 的位址、服務與狀態，是課堂比喻的「黃頁」。例如 AMF 要找支援某個 DNN 與切片的 SMF，可以先查 NRF，再直接呼叫選出的 SMF；NRF 不需要代轉每一次 SBI 請求。

## 10. NSSF - Network Slice Selection Function（網路切片選擇功能）

NSSF 協助 AMF 根據 UE 請求、訂閱與網路支援情況選擇可使用的網路切片，並協助選擇適合的 AMF 集合。我的理解是它協助決定 UE 能使用哪個切片，後續會話與資料路徑仍由 AMF、SMF、UPF 等角色共同建立。

## 11. NEF - Network Exposure Function（網路能力開放功能）

NEF 提供對外的 API 窗口，讓應用在受控的情況下使用核心網路能力。W6 中 AF 可透過 NEF 提出 Traffic Influence 請求，再經 UDR／PCF 或 PCF 的策略授權流程影響 SMF 選路，讓特定流量導向適合的邊緣服務。

## 12. N3IWF - Non-3GPP Interworking Function（非 3GPP 互通功能）

N3IWF 讓 UE 能經由不受信任的非 3GPP 接取網路，例如不受信任的 Wi-Fi，連入 5GC。它是這種接取方式與核心網路之間的互通窗口，協助安全接入，並把控制訊息與使用者資料分別銜接到 AMF、UPF。

## 13. TNGF - Trusted Non-3GPP Gateway Function（可信任非 3GPP 閘道功能）

TNGF 是可信任非 3GPP 接取網路與 5GC 之間的閘道，讓 UE 經由這類接取網路使用核心網路服務。W5-1 將它與 N3IWF 一起列出；我用「可信任接取走 TNGF，不受信任接取走 N3IWF」記住兩者的主要差異。

## 14. BSF - Binding Support Function（綁定支援功能）

BSF 提供政策綁定資訊，協助找到與特定使用者／會話相關的 PCF。W6 提到 SMF 的 BSF-aware PCF selection；我特別記住 BSF 是找 PCF 的功能，而 BFS 是選 UPF 錨點時使用的廣度優先搜尋演算法，兩者不能混淆。

## 15. AF - Application Function（應用功能）

AF 代表應用服務端的需求，例如 MEC 遊戲伺服器希望特定使用者流量走向附近的服務位置。它可透過 NEF 提出 Traffic Influence 請求，由 PCF 形成策略、SMF 調整路徑、UPF 執行；AF 是應用側角色，不一定部署在 free5GC 核心網路內。

## 補充：WebConsole

WebConsole 是 free5GC 提供的網頁管理介面，可用來新增與管理訂閱者、切片和 DNN 等設定，但不是 3GPP 定義的 NF。UE、RAN、DN 是系統中的其他角色，gtp5g 則是 UPF 使用的 Linux 核心模組，也不應當成獨立的 5GC NF。

## 教材依據

- `Lecture/W2-2 4G to 5G.pdf`：第 18、21 頁，控制面／使用者面分離及 4G 網元與 5G NF 的對照。
- `Lecture/W3 5G Architecture.pdf`：第 21、23–28 頁，主要 NF、介面與核心流程。
- `Lecture/W5-1 free5GC.pdf`：第 19、22–26、35 頁，NF 清單、SBA、NRF 與 UDM／UDR 分工。
- `Lecture/W5-2 5GC Network Functions AMF.pdf`：第 7–14、25、37–48 頁，AMF 職責、NAS 分工、狀態與業務流程。
- `Lecture/W6 5GC Network Functions SMF_UPF.pdf`：第 11–16、26–39、53–60、72、89–100 頁，SMF／UPF、規則、BSF、AF 與 Traffic Influence。
