.class public Lcom/example/temperatureconverter/Splash;
.super Landroid/app/Activity;
.source "Splash.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 8
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 2
    .parameter "savedInstanceState"

    .prologue
    .line 12
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 13
    const v1, 0x7f030001

    invoke-virtual {p0, v1}, Lcom/example/temperatureconverter/Splash;->setContentView(I)V

    .line 14
    new-instance v0, Lcom/example/temperatureconverter/Splash$1;

    invoke-direct {v0, p0}, Lcom/example/temperatureconverter/Splash$1;-><init>(Lcom/example/temperatureconverter/Splash;)V

    .line 28
    .local v0, timer:Ljava/lang/Thread;
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 31
    return-void
.end method

.method protected onPause()V
    .locals 0

    .prologue
    .line 36
    invoke-super {p0}, Landroid/app/Activity;->onPause()V

    .line 37
    invoke-virtual {p0}, Lcom/example/temperatureconverter/Splash;->finish()V

    .line 38
    return-void
.end method
