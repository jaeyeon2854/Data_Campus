import tensorflow as tf

(x_train,y_train),(x_test,y_test) = tf.keras.datasets.mnist.load_data()

print(len(x_train))
print(len(x_test))

model = tf.keras.Sequential(
    layers=[
        # 입력층
        tf.keras.layers.Flatten(input_shape=(28,28)),
        # 은닉층 128개:하이퍼파라미터, 활성함수 relu함수 사용(기울기소실문제x)
        tf.keras.layers.Dense(128,activation="relu"),
        # 은닉층 dropout층 (비율: 0.2)
        tf.keras.layers.Dropout(0.2),
        # 출력층 다중분류 : softmax 사용
        tf.keras.layers.Dense(10, activation="softmax")
    ]
)
model.summary()

model.compile(
    optimizer="adam",  # 경사하강법을 어떻게 하지
    loss="sparse_categorical_crossentropy",  # 레이블이 정답이 정수형태일경우 0~9 0~100
    metrics=["accuracy"],
)

history = model.fit(x_train, y_train, epochs=5)

test_loss, test_acc = model.evaluate(x_test, y_test, verbose=2)

print(f"정확도", test_acc)

import matplotlib.pyplot as plt
import numpy as np

predictions = model.predict(x_test)
pred = np.argmax(predictions[0])
# 0 00.12 0.0232 2 0.2323 9 1
print("==>", predictions[0])

print(f"예측값은 {pred} 실제값은{y_test[0]} 입니다")

plt.imshow(x_test[0])
plt.show()
#model.predict(x_test)

loss= history.history['loss']
accuracy= history.history['accuracy']

plt.plot(history.history['loss'])
plt.plot(history.history['accuracy'])

#plt.legend(['오차', '정확도'])
plt.legend(['loss', 'acc'])

plt.show()