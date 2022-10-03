'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "assets/AssetManifest.json": "eac274e38fb131828f24667bb1c3cf0b",
"assets/assets/fonts/FredokaOne-Regular.ttf": "58cc117001de0d11fef59a00943ddd81",
"assets/assets/fonts/GreatVibes-Regular.ttf": "4bd0ed00ca8deac6c6706a092d9afd13",
"assets/assets/fonts/Pacifico-Regular.ttf": "85bb2d0ec4a0da159de42e89089ccc0b",
"assets/assets/images/batata-frita.png": "f5262e52c061b77ee22112925ca25011",
"assets/assets/images/clientes-mesa.png": "7247471d15e12c5ee87eca850d4a8531",
"assets/assets/images/credit_card_master_card.png": "15f9eb2d925a39cda5dc440fb1a3dcc3",
"assets/assets/images/credit_card_visa.png": "ecdc71b6025423f22fdedc526811d251",
"assets/assets/images/endereco.png": "e37c41cdd433f04be986d9d4674b4d1d",
"assets/assets/images/hamburger-desmontando.png": "d1a64fd030edb97d29252893fbc5a0a9",
"assets/assets/images/lanche.png": "f969ef8cfd7e10ea567561deeafa366b",
"assets/assets/images/logo/apple-icon.png": "76000a10690224fc7887df26c23f1272",
"assets/assets/images/logo/google-logo.png": "bd18303f9e55205a8d883e81cee7bc6e",
"assets/assets/images/logo/instagram-logo.png": "82fe960041e13309bfbbadf0d27ee3e1",
"assets/assets/images/logo/logo.png": "d594779ef502a4408fe37d44e14cca1d",
"assets/assets/images/logo/logo_lojista.jpg": "92b8d797364ea7043caf9c2ac4d00ecf",
"assets/assets/images/not-found.png": "312ca80c5f72acd5f25f50c3c62e93c6",
"assets/assets/images/notifications.png": "f766eb6da6858b67f73bd8c227613e2c",
"assets/assets/images/perfil_empty.jpeg": "307a5b16f30bb38100a11b8bddda6039",
"assets/assets/images/perfil_empty2.png": "ba98c03078ef89991ae4829fc3cec509",
"assets/assets/images/pizza.png": "bd0f27f9863407a47b20f8bdc2b54309",
"assets/assets/images/refri.png": "e302f02480b19199ebf87fb0111e6d78",
"assets/FontManifest.json": "46572a6a4967c2349efb727350eb169b",
"assets/fonts/MaterialIcons-Regular.otf": "4e6447691c9509f7acdbf8a931a85ca1",
"assets/images/agua_doce_cachacaria.png": "c4405277ba1d361d8355ba34a16b18c7",
"assets/images/b10.jpg": "c3f5c3386ab52a24fe2de915eee3301c",
"assets/images/b11.jpg": "21848b6c79a2b640d3d02fd3f581e834",
"assets/images/b15.jpg": "11c887eb0d054ff3627676a968fde85d",
"assets/images/b19.jpg": "2bf010ecf91a6c6704b5dc215e2e143c",
"assets/images/b2.jpg": "e11dbbfab97961169811c86c3b1d26eb",
"assets/images/bg_orange_1.jpg": "63ad9bd0219218c195ee3676c554497d",
"assets/images/bg_orange_2.jpg": "c761246ee94eab750692f95784921a60",
"assets/images/bg_orange_3.jpg": "870b7602d3c9a51298cb253225146349",
"assets/images/bg_orange_4.png": "134976cb7824c156031f8218496f5dc0",
"assets/images/bg_orange_5.jpg": "5f086715838c5aaec2e9d41a48b5d70a",
"assets/images/bg_red_food.jpg": "89d7466b163bd847def88575be761627",
"assets/images/chaplin.png": "98524cbdf9294d7751ce2a00d828e038",
"assets/images/credit_card_master_card.png": "15f9eb2d925a39cda5dc440fb1a3dcc3",
"assets/images/credit_card_visa.png": "ecdc71b6025423f22fdedc526811d251",
"assets/images/dom_bife.jpg": "7820f9cf62f48423c3d43a61bcd6c61e",
"assets/images/donna_oliva.png": "0824fc9fa2ac0599f658e59a0c1db866",
"assets/images/eating.png": "ea8a08b4af0911fc295e1e1493cb2b99",
"assets/images/food-delivery.png": "bfc499e6df9b20095ae019d867535198",
"assets/images/icon-map.png": "5cddbc3608666419a770b112e825d1e7",
"assets/images/lanche.png": "f969ef8cfd7e10ea567561deeafa366b",
"assets/images/pizza.png": "bd0f27f9863407a47b20f8bdc2b54309",
"assets/images/porto_pizzaria.png": "0c24111726ec47bae91d9e73999c68e8",
"assets/images/qb-burger.png": "cbb16f11455d53c0750c914dc7117faa",
"assets/images/refri.png": "e302f02480b19199ebf87fb0111e6d78",
"assets/images/searching.png": "69e3deb4fd807951a6d7f5f7b3cd5ca0",
"assets/images/x_bacon.png": "063c1cc7f8ec19ff5792641133e4dc26",
"assets/images/x_calabresa.png": "4e2d96c8f3956af306d2c8dd0820e1bb",
"assets/images/x_frango.png": "a54472609a5e849373e54ddd6df3ba6f",
"assets/images/x_salada.png": "7e3ae433b90e8eac1276836024585865",
"assets/images/x_tudo.png": "faab603bf4d10626368860bf92b903da",
"assets/NOTICES": "8d799aa230dc7a8d4521303f87c1f87c",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"canvaskit/canvaskit.js": "62b9906717d7215a6ff4cc24efbd1b5c",
"canvaskit/canvaskit.wasm": "b179ba02b7a9f61ebc108f82c5a1ecdb",
"canvaskit/profiling/canvaskit.js": "3783918f48ef691e230156c251169480",
"canvaskit/profiling/canvaskit.wasm": "6d1b0fc1ec88c3110db88caa3393c580",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "2c4149be7eaed9f020d38d990d834c36",
"/": "2c4149be7eaed9f020d38d990d834c36",
"main.dart.js": "cf703d290ba7e900ce273e4ad9139021",
"manifest.json": "7604ef4e2e1f7792f73c74bfed32d3a9",
"menu_icon.png": "87dc3056ecea9768edf896d91ba82cb1",
"version.json": "80953b06808aa15db009508c8cb9bc02"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "/",
"main.dart.js",
"index.html",
"assets/NOTICES",
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
        // lazily populate the cache.
        return response || fetch(event.request).then((response) => {
          cache.put(event.request, response.clone());
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
