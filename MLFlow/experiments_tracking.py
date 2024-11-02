import mlflow
from mlflow.models import infer_signature

import pandas as pd
from sklearn import datasets
from sklearn.model_selection import train_test_split
from sklearn.tree import DecisionTreeClassifier
from sklearn.metrics import accuracy_score, precision_score, recall_score, f1_score


# Create a new MLflow Experiment
mlflow.set_experiment("MLflow Quickstart")

# Load the Iris dataset
X, y = datasets.load_iris(return_X_y=True)

# Split the data into training and test sets
X_train, X_test, y_train, y_test = train_test_split(
    X, y, test_size=0.2, random_state=42
)

params = {
    'criterion' : 'gini',
    'max_depth' : 15,
    'min_samples_split' : 3,
    'min_samples_leaf' : 4,
    'max_features' : 3,
    'random_state' : 10
}

with mlflow.start_run():
    # Train the model
    model = DecisionTreeClassifier(**params)
    model.fit(X_train, y_train)

    # Predict on the test set
    y_pred = model.predict(X_test)

    # Calculate metrics
    accuracy = accuracy_score(y_test, y_pred)
    precision = precision_score(y_test, y_pred, average='weighted')
    recall = recall_score(y_test, y_pred, average='weighted')
    f1_score = f1_score(y_test, y_pred, average='weighted')

    # Log the hyperparameters
    mlflow.log_params(params)

    # Log the loss metric
    mlflow.log_metric("accuracy_score", accuracy)
    mlflow.log_metric("precision_score", precision)
    mlflow.log_metric("recall_score", recall)
    mlflow.log_metric("f1_score", f1_score)

    # Set a tag that we can use to remind ourselves what this run was for
    mlflow.set_tag("Training Info", "Basic DecisionTree model for iris data")

    # Infer the model signature
    signature = infer_signature(X_train, model.predict(X_train))

    # Log the model
    model_info = mlflow.sklearn.log_model(
        sk_model = model,
        artifact_path = "iris_model",
        signature = signature,
        input_example = X_train,
        registered_model_name="Decision_Tree_params_set_1",
    )

    mlflow.sklearn.log_model(model, "model", signature = signature)
    # mlflow.pyfunc.save_model(path='MLFlow\\models_folder', python_model=model) -> Working