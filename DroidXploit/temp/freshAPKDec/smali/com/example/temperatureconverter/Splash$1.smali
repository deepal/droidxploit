.class Lcom/example/temperatureconverter/Splash$1;
.super Ljava/lang/Thread;
.source "Splash.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/example/temperatureconverter/Splash;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/example/temperatureconverter/Splash;


# direct methods
.method constructor <init>(Lcom/example/temperatureconverter/Splash;)V
    .locals 0
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lcom/example/temperatureconverter/Splash$1;->this$0:Lcom/example/temperatureconverter/Splash;

    .line 14
    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 17
    const-wide/16 v2, 0x1388

    :try_start_0
    invoke-static {v2, v3}, Lcom/example/temperatureconverter/Splash$1;->sleep(J)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 23
    new-instance v1, Landroid/content/Intent;

    const-string v2, "com.example.temperatureconverter.MAINACTIVITY"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 24
    .local v1, openStartActivity:Landroid/content/Intent;
    iget-object v2, p0, Lcom/example/temperatureconverter/Splash$1;->this$0:Lcom/example/temperatureconverter/Splash;

    invoke-virtual {v2, v1}, Lcom/example/temperatureconverter/Splash;->startActivity(Landroid/content/Intent;)V

    .line 26
    :goto_0
    return-void

    .line 19
    .end local v1           #openStartActivity:Landroid/content/Intent;
    :catch_0
    move-exception v0

    .line 20
    .local v0, ex:Ljava/lang/Exception;
    :try_start_1
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 23
    new-instance v1, Landroid/content/Intent;

    const-string v2, "com.example.temperatureconverter.MAINACTIVITY"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 24
    .restart local v1       #openStartActivity:Landroid/content/Intent;
    iget-object v2, p0, Lcom/example/temperatureconverter/Splash$1;->this$0:Lcom/example/temperatureconverter/Splash;

    invoke-virtual {v2, v1}, Lcom/example/temperatureconverter/Splash;->startActivity(Landroid/content/Intent;)V

    goto :goto_0

    .line 22
    .end local v0           #ex:Ljava/lang/Exception;
    .end local v1           #openStartActivity:Landroid/content/Intent;
    :catchall_0
    move-exception v2

    .line 23
    new-instance v1, Landroid/content/Intent;

    const-string v3, "com.example.temperatureconverter.MAINACTIVITY"

    invoke-direct {v1, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 24
    .restart local v1       #openStartActivity:Landroid/content/Intent;
    iget-object v3, p0, Lcom/example/temperatureconverter/Splash$1;->this$0:Lcom/example/temperatureconverter/Splash;

    invoke-virtual {v3, v1}, Lcom/example/temperatureconverter/Splash;->startActivity(Landroid/content/Intent;)V

    .line 25
    throw v2
.end method
