fn main() {
    let mut args = std::env::args().skip(1);

    let target = args.next().unwrap();
    let default_args = args.collect::<Vec<String>>();

    let mut command = std::process::Command::new(&target);
    command.args(default_args);

    if target.contains("vivaldi") {
        command.arg("--enable-features=VaapiVideoDecoder");
        command.arg("--enable-features=UseOzonePlatform");
        command.arg("--ozone-platform=wayland");
        command.arg("--enable-wayland-ime");
    }

    println!("Launching... {:?}", command);
    command.spawn().unwrap();
}
