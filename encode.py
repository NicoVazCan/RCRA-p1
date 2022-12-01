 

 # El archivo de texto numérico se convierte directamente en el método de forma de matriz de matriz dos
def txt_to_matrix():
	row = 0
	line = input()
	rows = len(line)
	datamat = ['']*rows # Matriz de inicialización

	while line:
		line = line.strip()
		if len(line) != rows:
			raise Exception("filas de distinto tamaño")
		datamat[row] =  line # strip () elimina el primer y último espacio o saltos de línea de las cadenas de forma predeterminada
		row += 1
		try:
			line = input()
		except EOFError:
			line = ''
	
	if row == rows:
		return datamat
	else:
		raise Exception("diferente número de filas que columnas")

def matrix_to_clingo(matrix):
	fila = len(matrix) 
	columna = fila
	for i in range(fila):
		for j in range(columna):
			print("celda(cord(" + str(j+1) + "," + str(i+1) + ")," + matrix[i][j] + ").")


matrix_to_clingo(txt_to_matrix())