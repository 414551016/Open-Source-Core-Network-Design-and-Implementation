
### Week 6 (2026-10-12) 	5GC Network Functions SMF/UPF  課堂逐字稿
#### 教學資源：
- [W6 5GC Network Functions SMF_UPF.pdf](https://github.com/414551016/Open-Source-Core-Network-Design-and-Implementation/blob/main/Lecture/W6%205GC%20Network%20Functions%20SMF_UPF.pdf)
- Prompt：
  - 請將本教學內容英/中翻譯比對
  - 請說明本slide教學重點內容及你的看法，最後以250字內總結
- 

## 知識點：
在 5G 核心網路（5G Core Network, 5GC）架構中，SMF 與 UPF 是實現控制面與使用者面分離（Control and User Plane Separation, CUPS）的兩個核心網路單元：
- SMF（Session Management Function，會話管理功能：
  <br>SMF 屬於控制面（Control Plane）單元，角色如同「高速公路的路網規劃中心（網路交通指揮官）」。它不直接處理用戶的數據流量，而是負責決策與控制。
  - 主要功能：
    - PDU Session 管理：負責建立、修改與刪除使用者的網路連線會話（PDU Session）。
    - IP 位址分配與管理：為行動裝置（UE）分配 IP 位址，並管理 IP 位址資源池。
    - UPF 選擇與控制：選擇合適的 UPF，並透過 N4 介面（使用 PFCP 協定）下發控制規則，指導 UPF 如何轉送封包。
    - 流量路由控制：配置使用者面的流量路由規則。
    - QoS 與策略執行：實施服務品質（QoS）控制，並執行來自 PCF 的策略。
    - 計費資訊收集：向計費系統（CHF）提供計費相關數據。
- UPF（User Plane Function，使用者面功能）：
  <br>UPF 屬於使用者面（User Plane）單元，角色如同「高速公路的收費站與匝道」。它是 5G 核心網中唯一負責處理與轉送使用者數據流量的網路元件（相當於 4G 的 S-GW-U 與 P-GW-U）。
  - 主要功能：
    - 封包路由與轉送：根據 SMF 發送的控制規則，轉送使用者的資料封包至目標網路（DN）。
    - 深度封包檢測（DPI）：識別不同的服務資料流。
    - QoS 處理：進行流量整型（Traffic Shaping）、流量管制（Policing）與封包標記。
    - 用量回報：統計並向 SMF 回報流量使用量，以支援計費與策略管理。
    - 本地分流（Local Breakout）：支援邊緣運算（MEC），將特定流量就近分流處理，降低傳輸延遲。
- 兩者的協作關係：
  - SMF 負責接收用戶連線需求並進行路由規劃。
  - SMF 透過 PFCP 協定（N4 介面）下達指令（例如：如何認車、放行到哪）給 UPF。
  - UPF 依照指令實際執行數據封包的檢查與轉送。
- 職責比較：
  |項目 |SMF  |UPF|
  |--|--|--|
  |全名 |Session Management FunctionUser |Plane Function|
  |類型 |Control Plane  |User Plane|
  |管理連線 |✓ |✗|
  |分配 IP |✓|✗|
  |建立 Session|✓|✗|
  |控制 QoS|✓|部分執行|
  |轉送資料封包|✗|✓|
  |與 Internet 連接|✗|✓|








# Week 5 (2026-10-06)課堂逐字稿

## slide：1
<div align="left" >
  <img src="./Lecture/W6 5GC Network Functions SMF_UPF/W6 5GC Network Functions SMF_UPF_page-0001.jpg" width="50%">
</div>











- 教學內容英/中翻譯比對：
  <br>Agenda（課程大綱 / 議程）
  - [(3)Superscalar Complexity | 超純量架構的複雜度](https://github.com/414551016/Computer-Architecture/blob/main/SD5-1_Superscalar%20Complexity.md)
    <br>問題起源（Superscalar Complexity）：探討超純量與亂序執行（OOO）處理器因硬體動態排程所帶來的電路複雜度、面積與高功耗瓶頸。
  - [(11)VLIW Basics | 超長指令字（VLIW）基本概念](https://github.com/414551016/Computer-Architecture/blob/main/SD5-2_VLIW%20Basics.md)
    <br>核心概念（VLIW Basics）：介紹 Very Long Instruction Word 的基本運作機制，即將多個指令打包並交由靜態排程。
  - [(19)Compiler Scheduling | 編譯器排程技術](https://github.com/414551016/Computer-Architecture/blob/main/SD5-3_Compiler%20Scheduling.md)
    <br>軟體核心（Compiler Scheduling）：講解編譯器如何扮演關鍵角色，負責指令排程、相依性檢查與平行度挖掘。
  - [(42)Enhancements to Classic VLIW | 傳統 VLIW 架構之強化與改進](https://github.com/414551016/Computer-Architecture/blob/main/SD5-4_Enhancements%20to%20Classic%20VLIW.md)
    <br>架構演進（Enhancements to Classic VLIW）：說明為克服傳統 VLIW 缺點（如程式碼膨脹、相容性問題）所引入的改進技術（如 Predication 謂詞執行、Speculation 投機執行等）。
  - [(45)Case Study: Intel Itanium | 案例研究：Intel Itanium 處理器](https://github.com/414551016/Computer-Architecture/blob/main/SD5-5_Case%20Study%20Intel%20Itanium.md)
- 教學重點內容：
- 我的看法與補充：
- 內容總結：

## slide：47
<div align="left" >
  <img src="./Lecture/SD5/SD5_page-0047.jpg" width="50%">
</div>

- 教學內容英/中翻譯比對：
- 教學重點內容：
- 我的看法與補充：
- 內容總結：


## slide：48
<div align="left" >
  <img src="./Lecture/SD5/SD5_page-0048.jpg" width="50%">
</div>

- 教學內容英/中翻譯比對：
- 教學重點內容：
- 我的看法與補充：
- 內容總結：

## slide：49
<div align="left" >
  <img src="./Lecture/SD5/SD5_page-0049.jpg" width="50%">
</div>

- 教學內容英/中翻譯比對：
- 教學重點內容：
- 我的看法與補充：
- 內容總結：

## slide：50
<div align="left" >
  <img src="./Lecture/SD5/SD5_page-0050.jpg" width="50%">
</div>

- 教學內容英/中翻譯比對：
- 教學重點內容：
- 我的看法與補充：
- 內容總結：

## slide：51
<div align="left" >
  <img src="./Lecture/SD5/SD5_page-0051.jpg" width="50%">
</div>

- 教學內容英/中翻譯比對：
- 教學重點內容：
- 我的看法與補充：
- 內容總結：

## slide：52
<div align="left" >
  <img src="./Lecture/SD5/SD5_page-0052.jpg" width="50%">
</div>

- 教學內容英/中翻譯比對：
- 教學重點內容：
- 我的看法與補充：
- 內容總結：

## slide：53
<div align="left" >
  <img src="./Lecture/SD5/SD5_page-0053.jpg" width="50%">
</div>

- 教學內容英/中翻譯比對：
- 教學重點內容：
- 我的看法與補充：
- 內容總結：

## slide：54
<div align="left" >
  <img src="./Lecture/SD5/SD5_page-0054.jpg" width="50%">
</div>

- 教學內容英/中翻譯比對：
- 教學重點內容：
- 我的看法與補充：
- 內容總結：

## slide：55
<div align="left" >
  <img src="./Lecture/SD5/SD5_page-0055.jpg" width="50%">
</div>

- 教學內容英/中翻譯比對：
- 教學重點內容：
- 我的看法與補充：
- 內容總結：

## slide：56
<div align="left" >
  <img src="./Lecture/SD5/SD5_page-0056.jpg" width="50%">
</div>

- 教學內容英/中翻譯比對：
- 教學重點內容：
- 我的看法與補充：
- 內容總結：





































