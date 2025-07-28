namespace CaaLab;

public interface ICreatable<T> where T : Godot.GodotObject
{
	static public abstract T Create();
}