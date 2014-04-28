#env = Environment(DFLAGS=['-g'], LIBS=['rt'])
env = Environment(DFLAGS=['-O', '-inline'], LIBS=['rt'])


nanoTimer = env.Object('nanoTimer.d')

env.Program('atomics', ['atomics.d',nanoTimer] )

env.Program('ninetynine.d')
