"""
    Parser
    ~~~~~~

    Parser tokenizes .asm input file
"""

class Parser:

    __slots__ = ('line', 'tokens', 'lc', 'has_more_commands', 'f', \
                    'command_type')

    def __init__(self, asm_file):

        self.line = ''      # line of input
        self.tokens = {}    # parsed line of input
        self.lc = 0         # current command line counter, ignore white space
        self.has_more_commands = True
        self.f = self.__open_file(asm_file)

    def __open_file(self, asm_file):
        return open(asm_file, 'r')

    def advance(self):
        if self.has_more_commands:
            try:
                self.line = next(self.f).strip()
                while (not self.line or self.line.startswith('//')):
                    self.advance()
            except StopIteration:
                self.has_more_commands = False
                self.f.close()

    def parse_command_type(self):
        if self.line.startswith('@'):
            command_type = 'A_COMMAND'
            self.lc += 1
        elif self.line.startswith('('):
            command_type = 'L_COMMAND'
        else:
            command_type = 'C_COMMAND'
            self.lc += 1

        self.command_type = command_type

    def get_line_count(self):
        return self.lc

    def get_symbol(self):
        if self.command_type in ('A_COMMAND', 'L_COMMAND'):
            symbol = self.line.split('//')[0].strip('@()')
            # remove tabs and other whitespace
            symbol = ''.join(symbol.split())
            return symbol
        else:
            raise ValueError('Asked to look for symbols in a C_COMMAND')

    def get_dest(self):
        if self.command_type in ('C_COMMAND',):
            if '=' in self.line:
                return self.line.split('=')[0].strip()
            else:
                return None
        else:
            raise ValueError('Asked to look for dest mnemonic in a ' \
                                'non-C_COMMAND')

    def get_comp(self):
        if self.command_type in ('C_COMMAND',):
            comp = self.line.split('//')[0]
            if '=' in comp:
                comp = comp.split('=')[1]
            if ';' in comp:
                comp.split(';')[0]
            return comp.strip()
        else:
            raise ValueError('Asked to look for comp mnemonic in a ' \
                                'non-C_COMMAND')

    def get_jump(self):
        if self.command_type in ('C_COMMAND',):
            if ';' in self.line:
                jump = self.line.split('//')[0]
                return self.line.split(';')[1].strip()
            else:
                return None
        else:
            raise ValueError('Asked to look for jump mnemonic in a ' \
                                'non-C_COMMAND')
