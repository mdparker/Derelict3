
export PROJECT_NAME     = derelict
export AUTHOR           = aladacron
export DESCRIPTION      = A collection of dynamic D bindings to C libraries, useful for multimedia and game development
export VERSION          = 3
export LICENSE          =
export ROOT_SOURCE_DIR  = derelict
DDOCFILES               =

# include some command
include command.make

SOURCES             = $(getSource)
OBJECTS             = $(patsubst %.d,$(BUILD_PATH)$(PATH_SEP)%.o,    $(SOURCES))
PICOBJECTS          = $(patsubst %.d,$(BUILD_PATH)$(PATH_SEP)%.pic.o,$(SOURCES))
HEADERS             = $(patsubst %.d,$(IMPORT_PATH)$(PATH_SEP)%.di,  $(SOURCES))
DOCUMENTATIONS      = $(patsubst %.d,$(DOC_PATH)$(PATH_SEP)%.html,   $(SOURCES))
DDOCUMENTATIONS     = $(patsubst %.d,$(DDOC_PATH)$(PATH_SEP)%.html,  $(SOURCES))
DDOC_FLAGS          = $(foreach macro,$(DDOCFILES), $(DDOC_MACRO)$(macro))
define make-lib
	$(MKDIR) $(DLIB_PATH)
	$(AR) rcs $(DLIB_PATH)$(PATH_SEP)$@ $^
	$(RANLIB) $(DLIB_PATH)$(PATH_SEP)$@
endef

############# BUILD #############
all: static-lib header doc pkgfile-static
	@echo ------------------ Building $^ done
all-shared: static-shared header doc pkgfile-shared
	@echo ------------------ Building $^ done

.PHONY : pkgfile
.PHONY : doc
.PHONY : ddoc
.PHONY : clean

static-lib: $(LIBNAME)

shared-lib: $(SONAME)

header: $(HEADERS)

doc: $(DOCUMENTATIONS)
	@echo ------------------ Building Doc done

ddoc: $(DDOCUMENTATIONS)
	$(DC) $(DDOC_FLAGS) index.d $(DF)$(DDOC_PATH)$(PATH_SEP)index.html
	@echo ------------------ Building DDoc done

geany-tag:
	@echo ------------------ Building geany tag
	$(MKDIR) geany_config
	geany -c geany_config -g $(PROJECT_NAME).d.tags $(SOURCES)

pkgfile-shared:
	@echo ------------------ Building pkg-config file
	@echo "# Package Information for pkg-config"                        >  $(PKG_CONFIG_FILE)
	@echo "# Author: $(AUTHOR)"                                         >> $(PKG_CONFIG_FILE)
	@echo "# Created: `date`"                                           >> $(PKG_CONFIG_FILE)
	@echo "# Licence: $(LICENSE)"                                       >> $(PKG_CONFIG_FILE)
	@echo                                                               >> $(PKG_CONFIG_FILE)
	@echo prefix=$(PREFIX)                                              >> $(PKG_CONFIG_FILE)
	@echo exec_prefix=$(PREFIX)                                         >> $(PKG_CONFIG_FILE)
	@echo libdir=$(LIB_DIR)                                             >> $(PKG_CONFIG_FILE)
	@echo includedir=$(INCLUDE_DIR)sqlite                               >> $(PKG_CONFIG_FILE)
	@echo                                                               >> $(PKG_CONFIG_FILE)
	@echo Name: "$(PROJECT_NAME)"                                       >> $(PKG_CONFIG_FILE)
	@echo Description: "$(DESCRIPTION)"                                 >> $(PKG_CONFIG_FILE)
	@echo Version: "$(VERSION)"                                         >> $(PKG_CONFIG_FILE)
	@echo Libs: $(LINKERFLAG)-l$(PROJECT_NAME)-$(COMPILER)              >> $(PKG_CONFIG_FILE)
	@echo Cflags: -I$(INCLUDE_DIR)sqlite $(LDCFLAGS)                    >> $(PKG_CONFIG_FILE)
	@echo                                                               >> $(PKG_CONFIG_FILE)

pkgfile-static:
	@echo ------------------ Building pkg-config file
	@echo "# Package Information for pkg-config"                        >  $(PKG_CONFIG_FILE)
	@echo "# Author: $(AUTHOR)"                                         >> $(PKG_CONFIG_FILE)
	@echo "# Created: `date`"                                           >> $(PKG_CONFIG_FILE)
	@echo "# Licence: $(LICENSE)"                                       >> $(PKG_CONFIG_FILE)
	@echo                                                               >> $(PKG_CONFIG_FILE)
	@echo prefix=$(PREFIX)                                              >> $(PKG_CONFIG_FILE)
	@echo exec_prefix=$(PREFIX)                                         >> $(PKG_CONFIG_FILE)
	@echo libdir=$(LIB_DIR)                                             >> $(PKG_CONFIG_FILE)
	@echo includedir=$(INCLUDE_DIR)sqlite                               >> $(PKG_CONFIG_FILE)
	@echo                                                               >> $(PKG_CONFIG_FILE)
	@echo Name: "$(PROJECT_NAME)"                                       >> $(PKG_CONFIG_FILE)
	@echo Description: "$(DESCRIPTION)"                                 >> $(PKG_CONFIG_FILE)
	@echo Version: "$(VERSION)"                                         >> $(PKG_CONFIG_FILE)
	@echo Libs: $(LIB_DIR)$(PATH_SEP)$(LIBNAME)                         >> $(PKG_CONFIG_FILE)
	@echo Cflags: -I$(INCLUDE_DIR)sqlite $(LDCFLAGS)                    >> $(PKG_CONFIG_FILE)
	@echo                                                               >> $(PKG_CONFIG_FILE)


# For build lib need create object files and after run make-lib
$(LIBNAME): $(OBJECTS)
	@echo ------------------ Building static library
	$(make-lib)

# For build shared lib need create shared object files
$(SONAME): $(PICOBJECTS)
	@echo ------------------ Building shared library
	$(MKDIR) $(DLIB_PATH)
	$(DC) -shared $(OUTPUT)$(DLIB_PATH)$(PATH_SEP)$@.$(VERSION) $^

# create object files
$(BUILD_PATH)$(PATH_SEP)%.o : %.d
	$(DC) $(DCFLAGS) $(DCFLAGS_LINK) $(DCFLAGS_IMPORT) -c $< $(OUTPUT)$@

# create shared object files
$(BUILD_PATH)$(PATH_SEP)%.pic.o : %.d
	$(DC) $(DCFLAGS) $(DCFLAGS_LINK) $(FPIC) $(DCFLAGS_IMPORT) -c $< $(OUTPUT)$@

# Generate Header files
$(IMPORT_PATH)$(PATH_SEP)%.di : %.d
	$(DC) $(DCFLAGS) $(DCFLAGS_LINK) $(DCFLAGS_IMPORT) -c $(NO_OBJ) $< $(HF)$@

# Generate Documentation
$(DOC_PATH)$(PATH_SEP)%.html : %.d
	$(DC) $(DCFLAGS) $(DCFLAGS_LINK) $(DCFLAGS_IMPORT) -c $(NO_OBJ)  $< $(DF)$@

# Generate ddoc Documentation
$(DDOC_PATH)$(PATH_SEP)%.html : %.d
	$(DC) $(DCFLAGS) $(DCFLAGS_LINK) $(DCFLAGS_IMPORT) -c $(NO_OBJ) $(DDOC_FLAGS) $< $(DF)$@

############# CLEAN #############
clean: clean-objects clean-static-lib clean-doc clean-header clean-pkgfile
	@echo ------------------ Cleaning $^ done

clean-shared: clean-shared-objects clean-shared-lib
	@echo ------------------ Cleaning $^ done

clean-objects:
	$(RM) $(OBJECTS)
	@echo ------------------ Cleaning objects done

clean-shared-objects:
	$(RM) $(PICOBJECTS)
	@echo ------------------ Cleaning shared-object done

clean-static-lib:
	$(RM) $(DLIB_PATH)$(PATH_SEP)$(LIBNAME)
	@echo ------------------ Cleaning static-lib done

clean-shared-lib:
	$(RM)  $(DLIB_PATH)$(PATH_SEP)$(SONAME).$(VERSION)
	@echo ------------------ Cleaning shared-lib done

clean-header:
	$(RM) $(HEADERS)
	@echo ------------------ Cleaning header done

clean-doc:
	$(RM) $(DOCUMENTATIONS)
	$(RM) $(DOC_PATH)
	@echo ------------------ Cleaning doc done

clean-ddoc:
	$(RM) $(DDOC_PATH)$(PATH_SEP)index.html
	$(RM) $(DDOC_PATH)
	@echo ------------------ Cleaning ddoc done

clean-geany-tag:
	$(RM) geany_config $(PROJECT_NAME).d.tags
	@echo ------------------ Cleaning geany tag done

clean-pkgfile:
	$(RM) $(PKG_CONFIG_FILE)
	@echo ------------------ Cleaning pkgfile done

############# INSTALL #############

install: install-static-lib install-doc install-header install-pkgfile
	@echo ------------------ Installing $^ done

install: install-shared-lib install-doc install-header install-pkgfile
	@echo ------------------ Installing $^ done

install-static-lib:
	$(MKDIR) $(LIB_DIR)
	$(CP) $(DLIB_PATH)$(PATH_SEP)$(LIBNAME) $(DESTDIR)$(LIB_DIR)
	@echo ------------------ Installing static-lib done

install-shared-lib:
	$(MKDIR) $(LIB_DIR)
	$(CP) $(DLIB_PATH)$(PATH_SEP)$(SONAME) $(DESTDIR)$(LIB_DIR)
	ln -s $(DESTDIR)$(LIB_DIR)$(SONAME).$(SO_VERSION)   $(DESTDIR)$(LIB_DIR)$(PATH_SEP)$(SONAME)
	@echo ------------------ Installing shared-lib done

install-header:
	$(MKDIR) $(INCLUDE_DIR)
	$(CP) $(IMPORT_PATH)$(PATH_SEP)$(PROJECT_NAME) $(DESTDIR)$(INCLUDE_DIR)
	@echo ------------------ Installing header done

install-doc:
	$(MKDIR) $(DATA_DIR)$(PATH_SEP)doc$(PATH_SEP)$(PROJECT_NAME)$(PATH_SEP)normal_doc$(PATH_SEP)
	$(CP) $(DOC_PATH)$(PATH_SEP)* $(DESTDIR)$(DATA_DIR)$(PATH_SEP)doc$(PATH_SEP)$(PROJECT_NAME)$(PATH_SEP)normal_doc$(PATH_SEP)
	@echo ------------------ Installing doc done

install-ddoc:
	$(MKDIR) $(DATA_DIR)$(PATH_SEP)doc$(PATH_SEP)$(PROJECT_NAME)$(PATH_SEP)cute_doc$(PATH_SEP)
	$(CP) $(DDOC_PATH)$(PATH_SEP)* $(DESTDIR)$(DATA_DIR)$(PATH_SEP)doc$(PATH_SEP)$(PROJECT_NAME)$(PATH_SEP)cute_doc$(PATH_SEP)
	@echo ------------------ Installing ddoc done

install-geany-tag:
	$(MKDIR) $(DATA_DIR)$(PATH_SEP)geany$(PATH_SEP)tags$(PATH_SEP)
	$(CP) $(PROJECT_NAME).d.tags $(DESTDIR)$(DATA_DIR)$(PATH_SEP)geany$(PATH_SEP)tags$(PATH_SEP)
	@echo ------------------ Installing geany tag done

install-pkgfile:
	$(MKDIR) $(PKGCONFIG_DIR)
	$(CP) $(PKG_CONFIG_FILE) $(DESTDIR)$(PKGCONFIG_DIR)
	@echo ------------------ Installing pkgfile done
