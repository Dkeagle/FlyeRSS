console.log("background running");

chrome.runtime.onInstalled.addListener(() => {
    // Create the parent menu item
    chrome.contextMenus.create({
        id: "parent",
        title: "FlyeRSS",
        contexts: ["action", "page"]
    });

    // Create child menu items
    chrome.contextMenus.create({
        id: "child1",
        parentId: "parent",
        title: "Child 1",
        contexts: ["action", "page"]
    });

    chrome.contextMenus.create({
        id: "child2",
        parentId: "parent",
        title: "Child 2",
        contexts: ["action", "page"]
    });

    // Create radio items
    chrome.contextMenus.create({
        id: "subparent",
        parentId: "parent",
        title: "Radio boxes",
        contexts: ["action", "page"]
    })
    chrome.contextMenus.create({
        id: "radio1",
        parentId: "subparent",
        title: "Radio 1",
        type: "radio",
        contexts: ["action", "page"]
    });
    chrome.contextMenus.create({
        id: "radio2",
        parentId: "subparent",
        title: "Radio 2",
        type: "radio",
        contexts: ["action", "page"]
    });
    chrome.contextMenus.create({
        id: "test",
        parentId: "subparent",
        type: "separator",
        contexts: ["action", "page"]
    })
    chrome.contextMenus.create({
        id: "radio3",
        parentId: "subparent",
        title: "Radio 3",
        type: "radio",
        contexts: ["action", "page"]
    });
    chrome.contextMenus.create({
        id: "radio4",
        parentId: "subparent",
        title: "Radio 4",
        type: "radio",
        contexts: ["action", "page"]
    });

    // Create checkbox items
    chrome.contextMenus.create({
        id: "checkbox1",
        parentId: "parent",
        title: "Checkbox 1",
        type: "checkbox",
        contexts: ["action", "page"]
    });

    chrome.contextMenus.create({
        id: "checkbox2",
        parentId: "parent",
        title: "Checkbox 2",
        type: "checkbox",
        contexts: ["action", "page"]
    });
});
