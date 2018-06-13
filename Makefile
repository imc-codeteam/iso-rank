CC=g++
# Add -DSEQ for sequential code
# Add -DNODE_PAIR for node pair method
# default method is broadcast
CFLAGS= -O3 -m64 -DEIGEN
INCLUDE= `pkg-config --cflags eigen3`
LIBRARIES= -lm

all:
	$(CC) $(CFLAGS) $(INCLUDE) $(INCLUDE_MPI) -c Vertex.cpp 
	$(CC) $(CFLAGS) $(INCLUDE) $(INCLUDE_MPI) -c main.cpp 
	$(CC) $(CFLAGS) $(INCLUDE) -o IsoRank main.o Vertex.o $(LIBRARIES)
	rm -f *.o

test: IsoRank
	./IsoRank -dir test2/ -match_alg con_enf_4 -num_files 2 -print