using System.Collections;
using System.Collections.Generic;
using System.IO;
using UnityEngine;
using UnityEngine.Networking;
using XLua;

public class HelloWorld01 : MonoBehaviour
{
    public LuaEnv luaEnv;

    void Start()
    {
        luaEnv = new LuaEnv();

        luaEnv.DoString("print('hello world')");
        luaEnv.DoString("CS.UnityEngine.Debug.Log('Hello World')");

        TextAsset ta = Resources.Load<TextAsset>("helloworld.lua");

        luaEnv.DoString(ta.text);

        //使用内置的loader调用，默认后缀 .lua.txt
        luaEnv.DoString("require 'helloworld'");

        //自定义loader
        //Debug.Log(Application.dataPath);
        luaEnv.AddLoader(MyLoader);

        luaEnv.DoString("require 'helloworld2'");
    }

    private byte[] MyLoader(ref string filepath)
    {

        filepath = Application.dataPath + "/Res/" + filepath + ".lua.txt";
        //Debug.Log(filepath);
        if (!File.Exists(filepath))
            return null;

        //Debug.Log(File.ReadAllText(filepath));
       string str = File.ReadAllText(filepath);

        //return File.ReadAllBytes(filepath);//直接这样写为什么会出错
       return System.Text.Encoding.UTF8.GetBytes(str);
    }



    void OnDestory()
    {
        luaEnv.Dispose();
    }

}
