import re

with open('/home/pranj/.gemini/antigravity-cli/brain/bae5dc40-d2f9-459f-a614-06412ff18aa7/scratch/meloworld-dotfiles/quickshell/osd/MediaPopup.qml', 'r') as f:
    content = f.read()

# Replace imports
content = content.replace('import "../theme"', 'import "../"')

# Replace PopupBase with Item
content = re.sub(r'PopupBase \{', 'Item {\n    MatugenColors { id: theme }\n    property color clock: theme.mauve\n    property color popupBackground: theme.base\n    property color textDim: theme.subtext0\n    property color textAccent: theme.text\n    property color trackBackground: theme.surface0\n    property color pillForeground: theme.base\n    property color rowBackground: theme.surface1\n    property color border: theme.surface2\n    property color textMain: theme.text\n', content, count=1)

# Remove Connections to SessionState
content = re.sub(r'Connections \{\s+target: SessionState\s+function onMediaPopupVisibleChanged\(\) \{.*?\n\s+\}\s+\}', '', content, flags=re.DOTALL)

# Replace PanelColors with root
content = content.replace('PanelColors.', 'root.')

# Remove PopupBase specific properties
content = re.sub(r'showDefaultBackground:.*?\n', '', content)
content = re.sub(r'borderColor:.*?\n', '', content)
content = re.sub(r'clipContent:.*?\n', '', content)
content = re.sub(r'contentHeight:.*?\n', '', content)

with open('/home/pranj/.config/quickshell/music/MediaPopup.qml', 'w') as f:
    f.write(content)

