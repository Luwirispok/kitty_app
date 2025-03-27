# kitty_app

The kitty app.

## Для старта

Для изучения и запуска проекта выполните следующие команды:

```
flutter pub get
dart run build_runner build --delete-conflicting-outputs
```

### Поддерживаемые платформы

- Android
- Ios

## Структура папок

### Core

Структура папок взята из [стартера](https://github.com/hawkkiller/sizzle_starter)

    ├── constant/assets/
    ├── layout/
    ├── rest_client/
    ├── theme/
    ├── router/
    ├── util/
    └── widget/

- `constant/assets/` - ресурсы проекта: цвета, шрифты, картинки, тени
- `di` - общие модули di
- `layout` - настройки и помощники ui 
- `rest_client` - настройка сети
- `theme` - тема и расширение 
- `router` - роутер
- `util` - общие функции (форматирование, валидация, логгер и т.д.)
- `widget` - общие виджеты

### Features

структура и отсутствие некоторых папок вдохновлялось выступление о [эволюционной архитектуре](https://youtu.be/ThtVERWO8rw)

    ├── data/
    │   ├── data_source/
    │   │   ├── dto/
    │   │   ├── request/
    │   │   └── feature_data_source_.dart
    │   └── repository/
    ├── domain/
    │   ├── entity/
    │   ├── usecase/ 
    ├── presentation/
    │   └── bloc/
    │       ├── feature_bloc.dart
    │       ├── feature_event.dart
    │       └── feature_state.dart
    │   ├── components/
    │   ├── fuature_screem.dart    
- `data` - взаимодействий с внешними ресурсами
    - `data_source` - обращение к серверу
        - `dto` - модели получаемые от сервера
        - `request` - модели для обращения к серверу
    - `repository` - репозиторий и его имплементация
- `domain` - логика модуля
    - `entity` - модели модуля
    - `usecase` - логика модуля
- `presentation` - ui и его логика
    - `bloc` - блок, эвенты, стейты, зависимости блока
    - `components` - виджеты экрана
