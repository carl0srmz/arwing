import hashlib
import os
import subprocess
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
EXPECTED_SHA1 = 'cf08148cd8f26d51f8c67c956179dfc594e7a4f1'
PY = [sys.executable, '-I']

def run(*cmd):
    print('>', ' '.join(cmd))
    subprocess.run(cmd, cwd=ROOT, check=True)

def main():
    if len(sys.argv) != 2:
        sys.exit('usage: python tools/build.py path/to/starfox.sfc')
    rom = os.path.abspath(sys.argv[1])
    os.makedirs(os.path.join(ROOT, 'build', 'gen'), exist_ok=True)
    run(*PY, 'tools/extract.py', rom)
    run(*PY, 'tools/asm.py', 'asm/starfox.s', 'build/starfox.sfc', 'build/ir.json')
    sha = hashlib.sha1(open(os.path.join(ROOT, 'build', 'starfox.sfc'), 'rb').read()).hexdigest()
    if sha != EXPECTED_SHA1:
        print(f'WARNING: build/starfox.sfc ({sha}) no longer matches the original - expected if you edited asm/')
    else:
        print('build/starfox.sfc: OK, matches original')
    run(*PY, 'tools/recomp.py', 'build/ir.json', 'build/gen')
    if os.name == 'nt':
        run('cmd', '/c', os.path.join(ROOT, 'build.bat'))
    elif sys.platform == 'darwin':
        run('sh', 'build_mac.sh')
    else:
        run('sh', 'build_linux.sh')
    print(f"done: {'build/starfox.exe' if os.name == 'nt' else 'build/arwing'}  (run it from the repository root; it loads build/starfox.sfc for game data)")

if __name__ == '__main__':
    main()
