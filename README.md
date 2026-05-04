# 📱 Crypto Application (iOS)

A modern cryptocurrency tracking application built using **SwiftUI**, **Combine**, and the **CoinGecko API**.
This app provides real-time market data, clean UI, and a scalable architecture designed for future growth.

---

## 🚀 Features

* 📊 Real-time cryptocurrency prices
* 🔍 Search and filter coins
* 📈 Detailed coin statistics and market data
* ⭐ Watchlist support *(optional if you added it)*
* ⚡ Smooth and responsive UI using SwiftUI
* 🔄 Reactive data handling with Combine
* 🌐 API integration using CoinGecko

---

## 🏗️ Architecture

The project follows the **MVVM (Model-View-ViewModel)** architecture to ensure:

* Clear separation of concerns
* Scalable and maintainable codebase
* Better testability
* Reusable components

```
View (SwiftUI)
   ↓
ViewModel (Combine-driven logic)
   ↓
Model (API/Data layer)
```

---

## 🧰 Tech Stack

* **Language:** Swift
* **UI Framework:** SwiftUI
* **Reactive Framework:** Combine
* **API:** CoinGecko API
* **Architecture:** MVVM

---

## 📡 API Integration

All cryptocurrency data is fetched using the **CoinGecko API**, which provides:

* Market prices
* Historical data
* Coin details
* Global market stats

---

## 📁 Project Structure

```
crypto-application/
│
├── Models/          # Data models
├── Views/           # SwiftUI views
├── ViewModels/      # Business logic
├── Services/        # API & networking layer
├── Utilities/       # Helpers & extensions
└── Resources/       # Assets, colors, etc.
```

---

## 📈 Scalability & Future Scope

This project is designed with scalability in mind. Future enhancements may include:

* 📊 Advanced analytics & insights dashboard
* 🔔 Price alerts & notifications
* 📉 Portfolio tracking
* 🌙 Dark mode enhancements
* 🔐 Authentication & user profiles
* ☁️ Cloud sync support

The architecture allows easy integration of these features without major refactoring.

---

## 📊 Analytics Scope

The application is structured to support analytics integration, such as:

* User behavior tracking
* Feature usage insights
* Performance monitoring

This can be extended using tools like Firebase Analytics or Mixpanel.

---

## 🛠️ Setup Instructions

1. Clone the repository:

   ```bash
   git clone https://github.com/AmanSingh1611/crypto-application.git
   ```

2. Open the project in Xcode:

   ```bash
   open crypto-application.xcodeproj
   ```

3. Build and run on simulator or device.

---

## 🎯 Learning Highlights

This project demonstrates:

* Building scalable iOS apps using SwiftUI
* Using Combine for reactive programming
* Implementing clean MVVM architecture
* Handling real-world API integration
* Structuring production-ready codebases

---

## 🤝 Contributing

Contributions are welcome! Feel free to fork the repo and submit a pull request.

---

## 📄 License

This project is open-source and available under the MIT License.

---

## 👨‍💻 Author

**Aman Singh**

---

⭐ If you found this project useful, consider giving it a star!
