"""
    Assembler
    ~~~~~~~~~

    Hack assember (.asm --> .hack)
"""

import sys
from parser import Parser



if __name__ == '__main__':
    asm_file = sys.argv[1]
    print(asm_file)

    parser = Parser(asm_file)
