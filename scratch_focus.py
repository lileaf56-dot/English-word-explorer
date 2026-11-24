with open('css/app.css', 'r', encoding='utf-8') as f:
    css = f.read()

import re
matches = re.findall(r'body\.focus-mode[^{]*\{[^}]*\}', css)
for m in matches:
    print(m)
