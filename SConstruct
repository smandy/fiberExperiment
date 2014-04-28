env = Environment(LIBS=['rt'])

env.VariantDir( 'build','src')


derelictLibs = [ 'DerelictSDLttf', 'DerelictSDL',
                      'DerelictGL', 
                      'DerelictGLU', 
                      'DerelictSFMLWindow', 
                      'DerelictSFMLGraphics', 
                      'DerelictSFMLSystem', 
                      'DerelictUtil', 
                      'dl' , 'phobos2']

derEnv = env.Clone()
derEnv.Append( DFLAGS =['-gc', '-I/home/andy/repos/Derelict2/import'] ,	
	       #LIBS=['DerelictSDL', 'DerelictGL', 'DerelictGLU', 'DerelictUtil', 'dl' ],
	       LIBS= derelictLibs,
	       LINKFLAGS=['-L/home/andy/repos/Derelict2/lib'] )

# Looks like we need derelict3 ( now DerelictOrg) to get funky, out-there functionality such as lines!!
d3Libs = ['DerelictSDL2',
          'DerelictODE',
          'DerelictUtil']

d3SourceRootFlags = ['-I/home/andy/repos/derelictorg/%s/source' % x for x in d3Libs]
d3LibRootFlags    = ['-L/home/andy/repos/derelictorg/%s/lib' % x for x in d3Libs]

d3Env = Environment( DFLAGS    = d3SourceRootFlags  + ['-gc'],
                     LIBS      = d3Libs + ['dl', 'SDL2', 'SDL2_ttf', 'ode'],
                     LINKFLAGS = d3LibRootFlags )

sdlEnv = Environment( CPPPATH=['/usr/include/SDL'],
                      LIBS = ['SDL', 'SDL_ttf'],
                      DFLAGS = ['-g']
                      )

sdl2Env = Environment( CPPPATH=['/usr/local/include/SDL2'],
                       CPPFLAGS = ['-std=c++11'], 
                      LIBS = ['SDL2', 'SDL2_ttf'],
                      DFLAGS = ['-g']
                      )


#Various experients to get SDL and/or sfml working. Looks like derelict2 is the only one that wants to play with the current congig.
if 0:
    derEnv.Program('vortex.d')
    #derEnv.Program('sdl2Example.d')
    derEnv.Program('sdlExampleOrig.d')
    derEnv.Program('sdlHelloWorldAgain.d')
    #derEnv.Progr/Dam( 'gl3tut.d')
    #derEnv.Program( 'gamedev.d')
    #derEnv.Program( 'vortexgl2.d')
    derEnv.Program('sdlExample.d')

mousey = derEnv.Object( 'mousey.d')

derEnv.Program( 'vortexDerelict2.d', LIBS = derelictLibs + [mousey])
derEnv.Program( 'ttfExperiment.d')

sdlEnv.Program( 'ttfExample.cpp' )
sdlEnv.Program( 'sdl6.cpp'       )
d3Env.Program(  'ttfD3Experiment.d')

ringBuffer   = d3Env.Object( 'ringbuffer.d')
billiardBall = d3Env.Object( 'billiardball.d')

odeExperiment= d3Env.Program( 'ODEExperiment.d')

d3Env.Program(  'qix', ['qix.d', ringBuffer, billiardBall])

sdl2Env.Program('ttf_lesson6.cpp')
