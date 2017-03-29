// chrome.tabs.onCreated.addListener(do_something);
// chrome.tabs.onUpdated.addListener(function(tabId, info, tab) {
//     if (info.status == 'complete') do_something(tab);
// });

// function do_something(tab) {
//     var tabUrl = tab.url;
//     if (tabUrl && tabUrl.indexOf("site_domain") != -1) {
//         chrome.tabs.insertCSS(tab.id, {
//             file: "inject.css"
//         });
//     }
// }