import sys
import clingo

if len(sys.argv) != 2:
	print("encode.py: usage error: Se debe especificar el número filas o columnas")
	sys.exit()

n = int(sys.argv[1])

matrix = []
for _ in range(n):
	matrix.append(['']*n)

line = input()

while line:
	if line.__contains__("Answer: "):
		if line.endswith("1"):
			line = input()

			for termstr in line.split():
				term = clingo.parse_term(termstr)

				if term.arguments[0].type == clingo.SymbolType.Function and (term.name == "celda" or term.name == "negro"):
					y = term.arguments[0].arguments[1].number-1
					x = term.arguments[0].arguments[0].number-1

					if not matrix[y][x] and len(term.arguments) == 2:
						if term.arguments[1].type == clingo.SymbolType.Number:
							v = str(term.arguments[1].number)
						elif term.arguments[1].type == clingo.SymbolType.Function:
							v = term.arguments[1].name
						else:
							print(term.arguments)
							raise Exception("simbolo de tipo " + str(term.arguments[1].type) + " inesperado")
					else:
						v = '*'

					matrix[y][x] = v
		else:
			raise Exception("existe mas de un modelo")
	line = input()
	

for y in range(n):
	print("".join(matrix[y]))