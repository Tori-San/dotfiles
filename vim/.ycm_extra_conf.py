def FlagsForFile( filename, **kwargs ):
  return {
    'flags': [ '-x', 'c++', '-std=c++14', '-Weverything', '-Wno-shadow-field-in-constructor', '-Wno-c++98-compat', '-Wno-missing-prototypes', '-Wno-c++98-compat-pedantic', '-Wno-shorten-64-to-32', '-Wno-missing-variable-declarations', '-Wno-exit-time-destructors', '-Wno-global-constructors', '-Wno-padded', '-Wno-sign-conversion']
  }