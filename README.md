# 🎬 Flutter Movie Search App

A beautiful, responsive Flutter application for searching and discovering movies and TV shows using the TMDb (The Movie Database) API. Built with BLoC pattern for state management.

## 📱 Screenshots

The app features a modern, Netflix-style interface with:
- Responsive grid layout for movie browsing
- Detailed movie screens with poster, synopsis, and action buttons
- Search functionality with real-time results
- Infinite scroll pagination for seamless browsing

## ✨ Features

### 🎯 Core Functionality
- **Search Movies & TV Shows**: Real-time search with TMDb API
- **Infinite Scroll Pagination**: Automatically loads more content when scrolling
- **Movie Details**: Comprehensive movie information with Netflix-style UI
- **Responsive Design**: Adapts to phones, tablets, and different screen orientations

### 🏗️ Technical Features
- **BLoC State Management**: Clean architecture with flutter_bloc
- **API Integration**: TMDb API for movie data and images
- **Image Caching**: Efficient image loading with cached_network_image
- **Error Handling**: Comprehensive error states with retry functionality
- **Loading States**: Smooth loading indicators and pagination

### 📱 UI/UX Features
- **Dark Theme**: Modern black theme throughout the app
- **Responsive Grid**: 2-4 columns based on screen width
- **Search Bar**: Clean search interface with clear functionality
- **Movie Cards**: Beautiful cards with posters, ratings, and movie type badges
- **Detail Screen**: Netflix-style movie detail page with action buttons

## 🛠️ Built With

- **Flutter**: Cross-platform mobile framework
- **flutter_bloc**: State management solution
- **http**: API calls and network requests
- **cached_network_image**: Image loading and caching
- **equatable**: Value equality for BLoC states

## 📋 Prerequisites

Before you begin, ensure you have met the following requirements:
- Flutter SDK (3.0 or higher)
- Dart SDK (2.17 or higher)
- Android Studio / VS Code
- TMDb API key (free registration required)

## 🚀 Installation

### 1. Clone the repository
```bash
git clone https://github.com/YugaJ7/Movie-App.git
```

### 2. Install dependencies
```bash
flutter pub get
```

### 3. Get TMDb API Key
1. Visit [The Movie Database (TMDb)](https://www.themoviedb.org/)
2. Create a free account
3. Go to Settings > API
4. Generate your API key

### 4. Configure API Key
**Important**: Add your API key and access token in `api_service.dart` in the service folder.

Open `lib/services/api_service.dart` and replace the placeholder:

```dart
class ApiService {
  static const String baseUrl = 'https://api.themoviedb.org/3';
  static const String apiKey = 'YOUR_API_KEY_HERE'; // Replace with your TMDb API key
  static const String accessToken = 'YOUR_ACCESS_TOKEN'; //Replace with your TMDb access token
  
  // ... rest of the code
}
```

### 5. Run the application
```bash
flutter run
```

## 📁 Project Structure

```
lib/
├── main.dart                 # App entry point
├── models/
│   └── movie.dart           # Movie data model
├── services/
│   ├── api_service.dart           # TMDb API service (ADD YOUR API KEY AND ACCESS TOKEN HERE)
│   ├── network_client.dart        # Generic HTTP wrapper (GET/POST, error handling)
│   └── exceptions/
│       ├── api_exception.dart     # For TMDB API errors (invalid key, rate limit, etc.)
│       └── network_exception.dart # For network-level errors (offline, timeout, etc.)

├── repositories/
│   └── movie_repository.dart # Data repository layer
├── blocs/                   # BLoC state management
│   ├── movie_bloc.dart
│   ├── movie_event.dart
│   └── movie_state.dart
├── screens/                 # App screens
│   ├── home/                # Main search screen
│   └── movie_detail         # Movie details screen
```

## 🎨 Key Components

### BLoC Architecture
- **MovieBloc**: Manages movie search and pagination state
- **Events**: SearchMovies, ClearSearch
- **States**: MovieInitial, MovieLoading, MovieSuccess, MovieError

### API Integration
- Search endpoint: `/search/multi`
- Image URLs: `https://image.tmdb.org/t/p/w500/` for posters

### Responsive Design
- **Phone Portrait**: 2 columns
- **Tablet**: 3 columns
- **Desktop**: 4 columns
- Maintains aspect ratio across all screen sizes

## 🔧 Configuration

### Dependencies in pubspec.yaml
```yaml
dependencies:
  flutter:
    sdk: flutter
  http: ^1.5.0
  equatable: ^2.0.7
  flutter_bloc: ^9.1.1
  cached_network_image: ^3.4.1
```

### API Configuration
Remember to add your TMDb API credentials in `lib/services/api_service.dart`:
- Replace `YOUR_API_KEY_HERE` with your actual API key
- The app will not work without a valid API key

## 🚀 Usage

### Initial Load
- No Searched Movie or TV shows

### Search Functionality
- Tap the search bar to search for movies and TV shows
- Results appear in real-time as you type
- Clear the search to return to popular movies

### Infinite Scroll
- Scroll down to automatically load more movies
- Works for search results
- Loading indicator appears at the bottom

### Movie Details
- Tap any movie card to view detailed information
- Netflix-style detail screen with poster and synopsis
- Action buttons for Play, Watchlist, Trailer, and Download



## Acknowledgments

- [The Movie Database (TMDb)](https://www.themoviedb.org/) for providing the movie data API
- Flutter team for the amazing framework
- BLoC library maintainers for the state management solution

---

**Note**: This app is for educational purposes and uses TMDb API. Make sure to comply with TMDb's terms of service when using their API.