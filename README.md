# I Am Rich (iOS 16+ / arm64)

Современный клон легендарного приложения **I Am Rich** (2008) на SwiftUI.  
Минимальная версия iOS: **16.0**. Архитектура: **arm64**.

Оригинальный IPA 2008 года был 32-битным (armv6) и на iOS 11+ не запускается.

---

## Как получить .ipa (с Windows / без Mac)

### Шаг 1. Создай репозиторий на GitHub

1. Зайди на [github.com](https://github.com) → **New repository**
2. Назови как угодно (например `IAmRich64`)
3. Сделай **Public** (для бесплатных Actions)
4. **Не** ставь галочки Create README / .gitignore

### Шаг 2. Залей этот проект

**Вариант А (самый простой через сайт GitHub):**

1. Скачай этот архив `IAmRich64.zip`
2. Распакуй
3. На странице пустого репозитория нажми **uploading an existing file**
4. Перетащи **все** файлы и папки из `IAmRich64/` (включая `.github`)
5. Commit changes

**Вариант Б (через git, если установлен):**

```bash
cd IAmRich64
git init
git add .
git commit -m "I Am Rich iOS 16"
git branch -M main
git remote add origin https://github.com/ТВОЙ_ЛОГИН/IAmRich64.git
git push -u origin main
```

### Шаг 3. Запусти сборку

1. В репозитории перейди во вкладку **Actions**
2. Выбери workflow **Build IPA**
3. Нажми **Run workflow** → **Run workflow**
4. Подожди 2–4 минуты (зелёная галочка)
5. Внизу в **Artifacts** скачай **IAmRich-ipa**
6. Распакуй zip → внутри будет файл `IAmRich.ipa`

---

## Установка на iPhone (iOS 16.x)

### Если есть TrollStore (рекомендуется)
- Просто открой `.ipa` в TrollStore → Install  
- Приложение останется после перезагрузки.

### Если джейлбрейк (Dopamine и т.п.)
- Filza + **AppSync Unified** → открыть `.ipa` → Install
- или через TrollStore

### Без джейлбрейка / TrollStore
Нужна подпись (AltStore, Sideloadly, Feather и т.д.) + бесплатный Apple ID.  
В этом случае в workflow нужно будет добавить подпись (сертификат + provisioning profile) — пиши, подскажу.

---

## Структура проекта

```
IAmRich64/
├── .github/workflows/build.yml   ← автоматическая сборка IPA
├── IAmRich/
│   ├── IAmRichApp.swift
│   ├── ContentView.swift
│   ├── Info.plist
│   └── Assets.xcassets/
├── IAmRich.xcodeproj/
└── README.md
```

Сборка идёт **без подписи** (`CODE_SIGNING_ALLOWED=NO`) — идеально для TrollStore и джейлбрейка.

---

## Что показывает приложение

- Глубокий красный градиентный фон
- Процедурно нарисованный рубиновый камень
- Текст «I AM RICH»
- Мантра оригинала: *I am rich, I deserv it, I am good, healthy & successful.*

Готово. Просто залей на GitHub и нажми кнопку.
