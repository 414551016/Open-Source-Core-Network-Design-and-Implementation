# Practice 1 - Installation
這份作業要完成三件事：①安裝 free5GC、②安裝 free-ran-ue 並成功啟動 gNB/UE、③在 free5GC VM 上使用 frush 測試。

## Description：

## 先建立兩台 Ubuntu VM
> 最重要的是：兩台 VM 必須可以互相 ping，而且都可以連 Internet。
- VM1
  - 名稱：free5GC
  - OS：Ubuntu 24.04 LTS
  - CPU：4 cores
  - RAM：8 GB
  - Disk：40~60 GB
- VM2
  - 名稱：free-ran-ue
  - OS：Ubuntu 24.04 LTS
  - CPU：2~4 cores
  - RAM：4~8 GB
  - Disk：30~40 GB

### 環境使用：
#### 下載 VirtualBox
- [Oracle VirtualBox 官方下載頁](https://www.virtualbox.org/wiki/Downloads?utm_source=chatgpt.com)
- 教學資源：
  - [「虛擬機教學」1. 免費的Oracle VM VirtualBox架設! How to create a virtual machine on VirtualBox !(06:44)](https://www.youtube.com/watch?v=4qbe5P4kC0w&list=PLzoF0xJbyYF1bRBvnu37kOJZSbSrlvZrB)
  - [「虛擬機教學」2. Linux Ubuntu安裝，以Oracle VM VirtualBox虛擬機安裝Ubuntu。 Install Ubuntu on VirtualBox in Windows!](https://www.youtube.com/watch?v=xnTtF-jJrMQ&list=PLzoF0xJbyYF1bRBvnu37kOJZSbSrlvZrB&index=2)
- 

#### 下載 Ubuntu 24.04.5 LTS
- 你的 free5GC 作業我建議使用：Ubuntu 24.04.5 LTS Desktop AMD64
  - [Ubuntu 24.04.5 LTS 官方下載頁](https://releases.ubuntu.com/24.04.5/?utm_source=chatgpt.com)


