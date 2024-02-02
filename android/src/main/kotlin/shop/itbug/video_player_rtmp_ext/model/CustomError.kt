package shop.itbug.video_player_rtmp_ext.model

enum class CustomError (val code: String,val message: String){
    NotFoundFile("100001","File resource not found")
}