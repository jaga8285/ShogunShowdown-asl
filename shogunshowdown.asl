state("ShogunShowdownDemo") {
    float timer: "UnityPlayer.dll", 0x01B095F0, 0x48, 0xB8, 0x8, 0x30, 0x10, 0x60, 0x64 ;
    uint levelId: "mono-2.0-bdwgc.dll",0x007280F8, 0x58, 0xC60, 0x68, 0, 0xA0, 0x28, 0x18;
    uint health: "mono-2.0-bdwgc.dll", 0x0074CF78, 0x420, 0x250, 0x158, 0xD8, 0, 0x28, 0x20;

}

start {
    return current.timer != 0;
}

isLoading {
    return true;
}

gameTime {
    return TimeSpan.FromSeconds(current.timer);
}

split {
    return old.levelId != current.levelId && current.health != 0;
}

reset {
    if (old.timer != 0 && current.timer == 0){
        print("RESET!");
        return true;
    }
}