import keras
import numpy as np

x_train = np.array([0,1])
y_train = x_train * 2 + 1
print(x_train) 
print(y_train)

x_test = np.array([2,3])
y_test = x_test * 2 + 1
print(x_test) 
print(y_test)

model = keras.models.Sequential()
model.add( keras.layers.Dense( 2, input_shape=(1,) ) )
model.add( keras.layers.Dense( 1 ) )
model.summary()
model.compile( 'SGD', 'mse' )

model.fit( x_train, y_train, epochs = 1000, verbose = 0 )
y_predict = model.predict( x_test )

print( y_predict.flatten() )
print( y_test )