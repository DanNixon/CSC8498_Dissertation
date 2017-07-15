#!/usr/bin/env python

import sys
import os
import numpy as np

# Get input filename
filename = sys.argv[1]
print("Input filename: {}".format(filename))

# Load data
data = np.loadtxt(fname=filename, delimiter=",", usecols=(0, 1, 2, 3))
print("Num data {}".format(len(data)))

# Convert quaternions to yaw/pitch/roll
def quat_to_ypr(x):
    qw = x[0]
    qx = x[1]
    qy = x[2]
    qz = x[3]

    ysqr = qy * qy;

    # pitch (x-axis rotation)
    t0 = 2.0 * (qw * qx + qy * qz);
    t1 = 1.0 - 2.0 * (qx * qx + ysqr);
    pitch = np.arctan2(t0, t1);

    # yaw (y-axis rotation)
    t2 = 2.0 * (qw * qy - qz * qx);
    t2 = np.clip(t2, -1.0, 1.0)
    yaw = np.arcsin(t2);

    # roll (z-axis rotation)
    t3 = 2.0 * (qw * qz + qx * qy);
    t4 = 1.0 - 2.0 * (ysqr + qz * qz);
    roll = np.arctan2(t3, t4);

    pitch = np.rad2deg(pitch)
    yaw = np.rad2deg(yaw)
    roll = np.rad2deg(roll)

    return [yaw, pitch, roll]

out_data = np.asarray(np.apply_along_axis(quat_to_ypr, axis=1, arr=data))

# Get output filename
filename_parts = os.path.splitext(filename)
out_filename = filename_parts[0] + "_ypr" + filename_parts[1]
print("Output filename: {}".format(out_filename))

# Save data
np.savetxt(fname=out_filename, X=out_data, delimiter=",", fmt="%.6f")
