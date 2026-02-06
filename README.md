# Mobile (Kuzco Package App)

Aplicación cliente construida sobre el **paquete `kuzco_app`**, donde toda la lógica/arquitectura vive en el paquete y este repo únicamente define **configuración del cliente**:

- Identidad del cliente (keys)
- URLs (discovery / imágenes)
- Versionado
- Temas (light/dark)
- Set de íconos (custom icons)
- Bootstrap / providers

---

## 🧩 Arquitectura

Este repositorio actúa como **cliente** del paquete versionado `kuzco_app`.

- **`kuzco_app`**: contiene navegación, módulos, providers, UI base y flujo de inicialización.
- **Remo del cliente**: provee `Env`, `ThemeData`, `AppIcons` y credenciales para inicializar el paquete.

---

## ✅ Requisitos

- Flutter (stable recomendado)
- Dart SDK compatible con tu versión de Flutter
- `flutterfire` (solo si tu app usa Firebase)
- Variables de entorno (ver sección **Env**)

---

## 🚀 Inicialización (Main)

La app se inicializa registrando la configuración del cliente con `KuzcoInitInformation(...)`,
haciendo `bootstrap()` y finalmente corriendo `KuzcoApp`.

```dart
import 'package:flutter/material.dart';

import 'package:kuzco_app/kuzcco_app.dart';
import 'package:test_mobile/theme/custom_icons.dart';
import 'package:test_mobile/theme/light_theme.dart';
import 'package:test_mobile/theme/dark_theme.dart';
import 'package:test_mobile/env/env.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  KuzcoInitInformation(
    discoveryUrl: Env.discoveryUrl,
    fullImageUrl: Env.fullImageUrl,
    thumbnailImageUrl: Env.thumbnailImageUrl,
    privateKey: Env.privateKey,
    publicKey: Env.publicKey,
    version: Env.version,
    lightTheme: LightTheme.data,
    darkTheme: DarkTheme.data,
    appIcons: CustomIcons.instance,
  );

  final providerContainer = await bootstrap();

  runApp(KuzcoApp(
    container: providerContainer,
    title: 'Nombre de tu app',
  ));
}
```
