using System;
using Godot;

namespace CaaLab;

public interface ISavable<T> where T : Resource
{
	public void Save()
	{
		
	}
}