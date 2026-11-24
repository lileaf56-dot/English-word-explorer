with open('js/bundle.js', 'r', encoding='utf-8') as f:
    js = f.read()

idx = js.find('setStep(step')
if idx != -1:
    print(js[idx-50:idx+1500])
else:
    print('not found setStep')
