package diary;

import javafx.collections.ObservableList;
import javafx.scene.control.*;
import javafx.util.StringConverter;

/*
    Редактор чисел, сохраняющий результат сразу после изменения (оригинальный Spinner требует нажатия Enter)
*/

 class SpinnerAutoCommit<T> extends Spinner<T> {

    public SpinnerAutoCommit() {
        super();
        addListenerKeyChange();
    }

    public SpinnerAutoCommit(int min, int max, int initialValue) {
        super(min, max, initialValue);
        addListenerKeyChange();
    }

    public SpinnerAutoCommit(int min, int max, int initialValue, int amountToStepBy) {
        super(min, max, initialValue, amountToStepBy);
        addListenerKeyChange();
    }

    public SpinnerAutoCommit(double min, double max, double initialValue) {
        super(min, max, initialValue);
        addListenerKeyChange();
    }

    public SpinnerAutoCommit(double min, double max, double initialValue, double amountToStepBy) {
        super(min, max, initialValue, amountToStepBy);
        addListenerKeyChange();
    }

    public SpinnerAutoCommit(ObservableList<T> items) {
        super(items);
        addListenerKeyChange();
    }

    public SpinnerAutoCommit(SpinnerValueFactory<T> valueFactory) {
        super(valueFactory);
        addListenerKeyChange();
    }

    private void addListenerKeyChange() {
        getEditor().textProperty().addListener((observable, oldValue, newValue) -> {
            commitEditorText();
        });
    }

    // Я не знаю что это, но оно работает
    private void commitEditorText() {
        if (!isEditable()) return;
        String text = getEditor().getText();
        SpinnerValueFactory<T> valueFactory = getValueFactory();
        if (valueFactory != null) {
            StringConverter<T> converter = valueFactory.getConverter();
            if (converter != null) {
                T value = converter.fromString(text);
                valueFactory.setValue(value);
            }
        }
    }
}