package service
{
	public interface IAuthenticateService
	{
		function login(username:String,password:String):void;
		function logOut():void;
	}
}