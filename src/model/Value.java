package model;

public class Value {
private String key;
private int value;
public Value(){}
public Value(String key, int value) {
	super();
	this.key = key;
	this.value = value;
}
public String getKey() {
	return key;
}
public void setKey(String key) {
	this.key = key;
}
public int getValue() {
	return value;
}
public void setValue(int value) {
	this.value = value;
}

}
