import 'package:flutter/material.dart';

/// Biblioteca de iconos personalizada para el sistema de diseño
/// 
/// Esta clase contiene todos los iconos personalizados utilizados en la aplicación.
/// Los iconos están organizados por categorías para facilitar su uso y mantenimiento.
class IconLibrary {
  IconLibrary._();

  // ============================================================================
  // ICONOS DE NAVEGACIÓN
  // ============================================================================
  
  /// Icono para el menú principal
  static const IconData menu = Icons.menu;
  
  /// Icono para cerrar
  static const IconData close = Icons.close;
  
  /// Icono para volver atrás
  static const IconData back = Icons.arrow_back;
  
  /// Icono para ir hacia adelante
  static const IconData forward = Icons.arrow_forward;
  
  /// Icono para expandir
  static const IconData expand = Icons.expand_more;
  
  /// Icono para contraer
  static const IconData collapse = Icons.expand_less;

  // ============================================================================
  // ICONOS DE ACCIONES
  // ============================================================================
  
  /// Icono para agregar
  static const IconData add = Icons.add;
  
  /// Icono para editar
  static const IconData edit = Icons.edit;
  
  /// Icono para eliminar
  static const IconData delete = Icons.delete;
  
  /// Icono para guardar
  static const IconData save = Icons.save;
  
  /// Icono para cancelar
  static const IconData cancel = Icons.cancel;
  
  /// Icono para confirmar
  static const IconData confirm = Icons.check;
  
  /// Icono para buscar
  static const IconData search = Icons.search;
  
  /// Icono para filtrar
  static const IconData filter = Icons.filter_list;

  // ============================================================================
  // ICONOS DE ESTADO
  // ============================================================================
  
  /// Icono de éxito
  static const IconData success = Icons.check_circle;
  
  /// Icono de error
  static const IconData error = Icons.error;
  
  /// Icono de advertencia
  static const IconData warning = Icons.warning;
  
  /// Icono de información
  static const IconData info = Icons.info;
  
  /// Icono de carga
  static const IconData loading = Icons.hourglass_empty;

  // ============================================================================
  // ICONOS DE USUARIO
  // ============================================================================
  
  /// Icono de usuario
  static const IconData user = Icons.person;
  
  /// Icono de perfil
  static const IconData profile = Icons.account_circle;
  
  /// Icono de configuración
  static const IconData settings = Icons.settings;
  
  /// Icono de notificaciones
  static const IconData notifications = Icons.notifications;
  
  /// Icono de mensajes
  static const IconData messages = Icons.message;

  // ============================================================================
  // ICONOS DE CONTENIDO
  // ============================================================================
  
  /// Icono de archivo
  static const IconData file = Icons.insert_drive_file;
  
  /// Icono de carpeta
  static const IconData folder = Icons.folder;
  
  /// Icono de imagen
  static const IconData image = Icons.image;
  
  /// Icono de video
  static const IconData video = Icons.video_library;
  
  /// Icono de documento
  static const IconData document = Icons.description;
  
  /// Icono de descarga
  static const IconData download = Icons.download;
  
  /// Icono de subida
  static const IconData upload = Icons.upload;

  // ============================================================================
  // ICONOS DE COMUNICACIÓN
  // ============================================================================
  
  /// Icono de teléfono
  static const IconData phone = Icons.phone;
  
  /// Icono de email
  static const IconData email = Icons.email;
  
  /// Icono de chat
  static const IconData chat = Icons.chat;
  
  /// Icono de compartir
  static const IconData share = Icons.share;
  
  /// Icono de enlace
  static const IconData link = Icons.link;

  // ============================================================================
  // ICONOS DE COMERCIO
  // ============================================================================
  
  /// Icono de carrito de compras
  static const IconData cart = Icons.shopping_cart;
  
  /// Icono de tienda
  static const IconData store = Icons.store;
  
  /// Icono de producto
  static const IconData product = Icons.inventory;
  
  /// Icono de pedido
  static const IconData order = Icons.receipt;
  
  /// Icono de pago
  static const IconData payment = Icons.payment;
  
  /// Icono de envío
  static const IconData shipping = Icons.local_shipping;
  
  /// Icono de factura
  static const IconData invoice = Icons.receipt_long;

  // ============================================================================
  // ICONOS DE ANALÍTICAS
  // ============================================================================
  
  /// Icono de gráfico
  static const IconData chart = Icons.bar_chart;
  
  /// Icono de estadísticas
  static const IconData stats = Icons.analytics;
  
  /// Icono de reporte
  static const IconData report = Icons.assessment;
  
  /// Icono de dashboard
  static const IconData dashboard = Icons.dashboard;
  
  /// Icono de métricas
  static const IconData metrics = Icons.trending_up;

  // ============================================================================
  // ICONOS DE SEGURIDAD
  // ============================================================================
  
  /// Icono de candado
  static const IconData lock = Icons.lock;
  
  /// Icono de candado abierto
  static const IconData unlock = Icons.lock_open;
  
  /// Icono de visibilidad
  static const IconData visibility = Icons.visibility;
  
  /// Icono de visibilidad oculta
  static const IconData visibilityOff = Icons.visibility_off;
  
  /// Icono de escudo
  static const IconData shield = Icons.security;

  // ============================================================================
  // ICONOS DE FECHA Y TIEMPO
  // ============================================================================
  
  /// Icono de calendario
  static const IconData calendar = Icons.calendar_today;
  
  /// Icono de reloj
  static const IconData clock = Icons.access_time;
  
  /// Icono de fecha
  static const IconData date = Icons.date_range;
  
  /// Icono de tiempo
  static const IconData time = Icons.schedule;

  // ============================================================================
  // ICONOS DE UBICACIÓN
  // ============================================================================
  
  /// Icono de ubicación
  static const IconData location = Icons.location_on;
  
  /// Icono de mapa
  static const IconData map = Icons.map;
  
  /// Icono de GPS
  static const IconData gps = Icons.gps_fixed;
  
  /// Icono de dirección
  static const IconData address = Icons.home;

  // ============================================================================
  // ICONOS DE REDES SOCIALES
  // ============================================================================
  
  /// Icono de Facebook
  static const IconData facebook = Icons.facebook;
  
  /// Icono de Twitter
  static const IconData twitter = Icons.flutter_dash;
  
  /// Icono de Instagram
  static const IconData instagram = Icons.camera_alt;
  
  /// Icono de LinkedIn
  static const IconData linkedin = Icons.work;
  
  /// Icono de YouTube
  static const IconData youtube = Icons.play_circle_filled;

  // ============================================================================
  // MÉTODOS DE UTILIDAD
  // ============================================================================
  
  /// Obtiene todos los iconos organizados por categoría
  static Map<String, List<IconData>> getAllIconsByCategory() {
    return {
      'Navegación': [menu, close, back, forward, expand, collapse],
      'Acciones': [add, edit, delete, save, cancel, confirm, search, filter],
      'Estado': [success, error, warning, info, loading],
      'Usuario': [user, profile, settings, notifications, messages],
      'Contenido': [file, folder, image, video, document, download, upload],
      'Comunicación': [phone, email, chat, share, link],
      'Comercio': [cart, store, product, order, payment, shipping, invoice],
      'Analíticas': [chart, stats, report, dashboard, metrics],
      'Seguridad': [lock, unlock, visibility, visibilityOff, shield],
      'Fecha y Tiempo': [calendar, clock, date, time],
      'Ubicación': [location, map, gps, address],
      'Redes Sociales': [facebook, twitter, instagram, linkedin, youtube],
    };
  }
  
  /// Obtiene todos los iconos en una lista plana
  static List<IconData> getAllIcons() {
    return getAllIconsByCategory().values.expand((icons) => icons).toList();
  }
  
  /// Busca iconos por nombre
  static List<IconData> searchIcons(String query) {
    if (query.isEmpty) return getAllIcons();
    
    final lowercaseQuery = query.toLowerCase();
    final allIcons = getAllIconsByCategory();
    final results = <IconData>[];
    
    for (final entry in allIcons.entries) {
      if (entry.key.toLowerCase().contains(lowercaseQuery)) {
        results.addAll(entry.value);
      }
    }
    
    return results;
  }
} 