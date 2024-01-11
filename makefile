BUILD = build
CC    = c++ 

#-----------------------------------------
#Optimization ----------------------------
OPT   =  -O3 -g

#-----------------------------------------

TARGETS = springmass explicitfem implicitfem fluid rigidbody partviewer
OBJECTS := jsoncpp.o 
OBJECTS := $(addprefix $(BUILD)/, $(OBJECTS))

#-----------------------------------------

CCOPTS = $(OPT) -I$(HOME)/.local/include/eigen-3.4.0
LDOPTS = 

#-----------------------------------------
#-----------------------------------------

default: $(TARGETS)

springmass: $(BUILD)/springmass

clean:
	/bin/rm -f *.o $(TARGETS)

#-----------------------------------------
#-----------------------------------------

$(BUILD)/springmass: $(OBJECTS) $(BUILD)/springmass.o
	$(CC) $(OBJECTS) $(LDOPTS) $(BUILD)/springmass.o -o $@ 

explicitfem: $(OBJECTS) explicitfem.o
	$(CC) $(OBJECTS) $(LDOPTS) explicitfem.o -o explicitfem

implicitfem: $(OBJECTS) implicitfem.o
	$(CC) $(OBJECTS) $(LDOPTS) implicitfem.o -o implicitfem

fluid: $(OBJECTS) fluid.o
	$(CC) $(OBJECTS) $(LDOPTS) fluid.o -o fluid

rigidbody: $(OBJECTS) rigidbody.o
	$(CC) $(OBJECTS) $(LDOPTS) rigidbody.o -o rigidbody

partviewer: $(OBJECTS) partviewer.o
	$(CC) $(OBJECTS) $(LDOPTS) -framework OpenGL -framework GLUT -framework foundation partviewer.o -o partviewer

#-----------------------------------------
#-----------------------------------------

$(BUILD)/%.o: src/%.cpp  | $(BUILD)
	$(CC) $(CCOPTS) -c $< -o $@

#-----------------------------------------
#-----------------------------------------

$(BUILD):
	mkdir -p $(BUILD)















