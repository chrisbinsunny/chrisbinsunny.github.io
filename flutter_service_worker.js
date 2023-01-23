'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "styles.css": "713d8c49627c44e221afff6b71d135b8",
"flutter.js": "f85e6fb278b0fd20c349186fb46ae36d",
"index.html": "ee276a61b5c4692534cc74afbf4f7d5d",
"/": "ee276a61b5c4692534cc74afbf4f7d5d",
"main.dart.js": "5071e3fb91617c168c32c7143652a999",
"manifest.json": "b87dabf8439c3f3ccdf93eb070399baf",
"favicon.png": "9c372d68a373b89db30c9b89c4f9a8ea",
"icons/Icon-512.png": "5c3d45bcaddcf08b3681491809ab7b39",
"icons/Icon-maskable-512.png": "3666fc35959b311efeb57bc33dddbbb9",
"icons/Icon-maskable-192.png": "aea6ba2b7e6cae9fc1c68b21c749f31d",
"icons/Icon-192.png": "04237a90ee8b4f541b440e831ffa8434",
"assets/FontManifest.json": "e274c036caf7a1ed31bfbc19bde9a19d",
"assets/images/chrisbinBG.jpg": "75f6ec3ac9f83252c0ebd2871275ecf5",
"assets/images/chrisbinIndex.jpg": "5bebd30c6b791818decf9d455e3cf0de",
"assets/images/chrishubWeb.jpg": "9bc91143f0f2d78f99be63acca6d3f40",
"assets/images/macGuy.png": "bac7e3a3e600d97466d3e04dd810b3ce",
"assets/images/macGuy.jpg": "883da0150bcaaf0507c33b7a6e244f7a",
"assets/images/chrisbin.jpg": "fb849adcf1933015410feae56f113aa8",
"assets/images/flutterTalks.jpg": "d67e6cad3a9891dad26821c7b1da0b2f",
"assets/images/flutterTalksWeb.jpg": "4352ca283f70cc996e38428397893e9d",
"assets/images/qrCode.png": "3e6f25dc742ad734a95391fc6d3908f0",
"assets/images/dream.png": "968c1b8b297aa81edd9e1243e9e5313f",
"assets/images/dreamWeb.jpg": "6a36409327ebd58051a4cd4ae2f73df6",
"assets/images/chrishub.jpg": "29e9f601523abf968325fbbaec4a1dc0",
"assets/NOTICES": "79f47f488b3eb98728a1b98e0163e038",
"assets/fonts/GilroyUltraLight.otf": "7c721d9922be62a968d279c7cfef9bbb",
"assets/fonts/GilroySemiBold.otf": "5b057a227c11cb0c43e7502d7c3933b6",
"assets/fonts/GilroyBold.otf": "7fb352649483a9aa67ca0731692e84a5",
"assets/fonts/GilroyThin.otf": "7f7d0869706cb2bef1c125a7a4357e6c",
"assets/fonts/GilroyMedium.otf": "9e12d6053ae1c539d9be9d6fa86d33a7",
"assets/fonts/GilroyRegular.otf": "1e09f38cc59a3ccc24cd2d7d745566ac",
"assets/fonts/GilroyLight.otf": "d90fa984926d3745c7e68bc525692c26",
"assets/fonts/GilroyBlack.otf": "19d313b9f58424237dea452a1da65cc0",
"assets/fonts/GilroyExtraBold.otf": "01bee9655bf434da91a4f4f5eed32339",
"assets/fonts/MaterialIcons-Regular.otf": "95db9098c58fd6db106f1116bae85a0b",
"assets/shaders/ink_sparkle.frag": "ab4751ef630837e294889ca64470bb70",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "d8e9b6203ce2657c991f0b339ccb3a6d",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "48ce1bb8a42776caa951cb782d277730",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "99f29024aee8f4672a47cc3a81b9b84a",
"assets/AssetManifest.json": "555a20f691378c2cf4f92e00e00a91fe",
"canvaskit/canvaskit.wasm": "bf50631470eb967688cca13ee181af62",
"canvaskit/canvaskit.js": "2bc454a691c631b07a9307ac4ca47797",
"canvaskit/profiling/canvaskit.wasm": "95a45378b69e77af5ed2bc72b2209b94",
"canvaskit/profiling/canvaskit.js": "38164e5a72bdad0faa4ce740c9b8e564",
"version.json": "009c9e65172e010890f7f65fde438006",
"scripts/botd-1.1.0.js": "59799f492214d206697685b336ec3121"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "main.dart.js",
"index.html",
"assets/AssetManifest.json",
"assets/FontManifest.json"];
// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});

// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});

// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});

self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});

// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}

// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
