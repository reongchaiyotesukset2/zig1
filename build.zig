const std = @import("std");
pub fn build(b: *std.Build) void {

    const target = b.standardTargetOptions(.{});

    const optimize = b.standardOptimizeOption(.{});

    const lib_mod = b.createModule(.{

        .root_source_file = b.path("src/root.zig"),
        .target = target,
        .optimize = optimize,
    });
    const lib_mod2 = b.createModule(.{

        .root_source_file = b.path("src/test1.zig"),
                                   .target = target,
                                   .optimize = optimize,
    });

    const exe_mod = b.createModule(.{

        .root_source_file = b.path("src/main.zig"),
        .target = target,
        .optimize = optimize,
    });


    exe_mod.addImport("zig1_lib", lib_mod);
    exe_mod.addImport("zig2_lib", lib_mod2);

    const lib = b.addLibrary(.{
        .linkage = .static,
        .name = "zig1",
        .root_module = lib_mod,
    });


    b.installArtifact(lib);


    const exe = b.addExecutable(.{
        .name = "zig1",
        .root_module = exe_mod,
    });

    b.installArtifact(exe);


    const run_cmd = b.addRunArtifact(exe);
    run_cmd.step.dependOn(b.getInstallStep());
    if (b.args) |args| {
        run_cmd.addArgs(args);
    }
}
