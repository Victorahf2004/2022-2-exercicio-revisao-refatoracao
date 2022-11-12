CC=g++
CFLAGS=-std=c++11 -Wall
TARGET=vpl_execution

BUILD_DIR = ./build
SRC_DIR = ./src
INCLUDE_DIR = ./include
ENT_DIR = ./src/entidades

${TARGET}:  ${BUILD_DIR}/produto.o ${BUILD_DIR}/pedido.o ${BUILD_DIR}/pizza.o ${BUILD_DIR}/hamburguer.o ${BUILD_DIR}/pizza_marguerita.o ${BUILD_DIR}/pizza_calabresa.o ${BUILD_DIR}/main.o

	${CC} ${CFLAGS}  ${BUILD_DIR}/produto.o ${BUILD_DIR}/pedido.o ${BUILD_DIR}/pizza.o ${BUILD_DIR}/hamburguer.o ${BUILD_DIR}/pizza_marguerita.o ${BUILD_DIR}/pizza_calabresa.o ${BUILD_DIR}/main.o -o ${TARGET}

#diretorio e o .o 
${BUILD_DIR}/produto.o: ${INCLUDE_DIR}/produto.hpp ${ENT_DIR}/produto.cpp

	${CC} ${CFLAGS} -I ${INCLUDE_DIR}/ -c ${ENT_DIR}/produto.cpp -o ${BUILD_DIR}/produto.o

${BUILD_DIR}/pedido.o: ${INCLUDE_DIR}/pedido.hpp ${ENT_DIR}/pedido.cpp ${INCLUDE_DIR}/produto.hpp ${INCLUDE_DIR}/hamburguer.hpp ${INCLUDE_DIR}/pizza.hpp ${INCLUDE_DIR}/pizza_marguerita.hpp ${INCLUDE_DIR}/pizza_calabresa.hpp

	${CC} ${CFLAGS} -I ${INCLUDE_DIR}/ -c ${ENT_DIR}/pedido.cpp -o ${BUILD_DIR}/pedido.o

${BUILD_DIR}/hamburguer.o: ${INCLUDE_DIR}/hamburguer.hpp ${ENT_DIR}/hamburguer.cpp ${INCLUDE_DIR}/produto.hpp ${INCLUDE_DIR}/pedido.hpp  
#esse include só fala o diretório dos hpp
	${CC} ${CFLAGS} -I ${INCLUDE_DIR}/ -c ${ENT_DIR}/hamburguer.cpp -o ${BUILD_DIR}/hamburguer.o 

${BUILD_DIR}/pizza.o: ${INCLUDE_DIR}/pizza.hpp ${ENT_DIR}/pizza.cpp ${INCLUDE_DIR}/produto.hpp ${INCLUDE_DIR}/pedido.hpp

	${CC} ${CFLAGS} -I ${INCLUDE_DIR}/ -c ${ENT_DIR}/Vilao.cpp -o ${BUILD_DIR}/Vilao.o 

${BUILD_DIR}/main.o: ${INCLUDE_DIR}/Personagem.hpp ${INCLUDE_DIR}/Heroi.hpp ${INCLUDE_DIR}/Vilao.hpp ${SRC_DIR}/main.cpp

	${CC} ${CFLAGS} -I ${INCLUDE_DIR}/ -c ${SRC_DIR}/main.cpp -o ${BUILD_DIR}/main.o 


clean:
	rm -f ${BUILD_DIR}/*