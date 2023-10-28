Proceso sin_titulo
	Algoritmo sin_titulo
		Definir opcin,contador,viaje Como Entero
		
		
		
		Definir ruta, pasaje Como Caracter
		
		Definir capacidad, contadores Como Entero
		
		Dimension ruta[4], capacidad[4], pasaje[120,6,4], contadores[4]
		
		carga(ruta,capacidad, contadores)
		
		Escribir "BIENVENIDO AL SISTEMA DE VENTA DE PASAJES AEREOS"
		repetir
			Repetir
				Escribir "Ingrese una opcion"
				Escribir "1. Venta pasaje"
				Escribir "2. Buscar pasaje vendido"
				Escribir "3. Buscar pasajero"
				Escribir "4. Ordenar y mostrar lista pasajeros"
				Escribir "5. Listado/s"
				Escribir "6. Salir"
				Leer opcin
			Mientras Que opcin < 1 | opcin > 6
			
			segun opcin
				1 : 
					ventaPasaje(ruta,capacidad,pasaje,contadores)
				2:
					
				3:
					escribir "¿que viaje va a realizar la persona a buscar?"
					Escribir "1- Buenos Aires - Bariloche"
					Escribir "2- Bueno Aires - Salta"
					Escribir "3- Rosario - Buenos Aires"
					Escribir "4- Mar Del Plata - Mendoza"
					leer viaje
					Mientras viaje<1 o viaje>4
						escribir "ingrese un numero correcto"
						leer viaje
					FinMientras
					busqueda(pasaje,contadores,viaje)
				4:
					orden(pasaje,cant,k)
					escribir "ingrese el viaje que desea ver la lista de pasajeros"
					Escribir "1- Buenos Aires - Bariloche"
					Escribir "2- Bueno Aires - Salta"
					Escribir "3- Rosario - Buenos Aires"
					Escribir "4- Mar Del Plata - Mendoza"
					leer viaje
					Mientras viaje<1 o viaje>4
						escribir "ingrese un numero correcto"
						leer viaje
					FinMientras
					segun(viaje)
						1:
					FinSegun
					orden(pasaje,contador[viaje-1],viaje)
					
			FinSegun
		hasta que opcin==6
		
FinAlgoritmo

SubProceso carga(ruta, capacidad, contadores)
	ruta[0]="Buenos Aires - Bariloche"
	ruta[1]="Bueno Aires - Salta"
	ruta[2]="Rosario - Buenos Aires"
	ruta[3]="Mar Del Plata - Mendoza"
	
	capacidad[0]= 120
	capacidad[1]= 120
	capacidad[2]= 80
	capacidad[3]= 80
	
	contadores[0]= 0
	contadores[1]= 0
	contadores[2]= 0
	contadores[3]= 0
	
FinSubProceso

SubProceso ventaPasaje(ruta,capacidad,pasaje,contadores)
	definir opc Como Entero
	definir bandera Como Logico
	bandera=Verdadero
	definir hayVuelo Como Entero
	Escribir "Ingresar que vuelo desea comprar:"
	Escribir "1- Buenos Aires - Bariloche"
	Escribir "2- Bueno Aires - Salta"
	Escribir "3- Rosario - Buenos Aires"
	Escribir "4- Mar Del Plata - Mendoza"
	leer opc
	mientras(opc<1 o opc>4)
		escribir "Numero incorrecto"
		leer opc
	FinMientras
	Repetir
		
		
		Si capacidad[opc-1]>0
			Escribir "Ingresar nombre y apellido del pasajero:"
			Leer pasaje[contadores[opc-1],0,opc-1]
			Escribir "Ingresar el DNI del pasajero: "
			Leer pasaje[contadores[opc-1],1,opc-1]
			Escribir "Ingresar el numero de telefono: "
			Leer pasaje[contadores[opc-1],2,opc-1]
			Escribir "Ingresar Verdadero- Si tiene equipaje en bodega  Falso- Si no tiene equipaje en bodega: "
			Leer pasaje[contadores[opc-1],3,opc-1]
			Escribir "Ingresar numero de pasajero frecuente: "
			Leer pasaje[contadores[opc-1],4,opc-1]
			
			contadores[opc-1]=contadores[opc-1]+1
			pasaje[contadores[opc-1],5,opc-1]=convertiratexto(contadores[opc-1])
			capacidad[opc-1]=capacidad[opc-1]-1
			
			Escribir "Desea cargar mas vuelos? 1-SI 2-NO"
			Leer hayVuelo
			Si hayVuelo==2
				bandera=Falso
			FinSi
		Sino 
			Escribir "No hay mas pasajes"
			bandera=falso
		FinSi
		
	Mientras Que bandera y capacidad[opc-1] >0
FinSubProceso

SubProceso orden(pasaje,cant,k)
	definir maxMin,i,j,ascDes Como Entero
	definir aux como cadena
	escribir"Ingrese: "
	escribir"1-Lista Ascendente"
	escribir "2-Lista Descendente"
	leer ascDes
	Mientras ascDes<1 o ascDes>2
		escribir "Ingrese un numero correcto"
		leer ascDes
	FinMientras
	
	para i=0 Hasta cant-2
		maxMin=i
		para j=i+1 hasta cant-1
			segun ascDes
				1:
					si ConvertirANumero(pasaje[j,5,k])<convertiranumero(pasaje[maxMin,5,k]) 
						
						maxmin=j
					FinSi
				2:
					si ConvertirANumero(pasaje[j,5,k])>ConvertirANumero(pasaje[maxMin,5,k])
						
						maxmin=j
					FinSi
			FinSegun
		FinPara
		para h=0 hasta 5
			aux=pasaje[i,h,k]
			pasaje[i,h,k]=pasaje[maxMin,5,k]
			pasaje[maxMin,h,k]=aux
		FinPara
	FinPara
	
	
FinSubProceso


SubProceso busqueda(pasaje,contadores,viaje)
	definir bajo,alto,centro,busca Como Entero
	
	definir encontrado Como Logico
	
	encontrado=falso
	escribir "Ingrese el numero de documento"
	bajo=0
	alto=contadores[viaje]
	leer busca
	Repetir
		centro=trunc((bajo+alto)/2)
		si busca=ConvertirANumero(pasaje[centro,5,viaje])
			escribir "Encontrado"
			encontrado=verdadero
		SiNo
			si busca<ConvertirANumero(pasaje[centro,5,viaje])
				alto=centro-1
			SiNo
				bajo=centro+1
			FinSi
		FinSi
		
	Mientras Que !encontrado o bajo>alto
	
FinSubProceso
FinProceso
