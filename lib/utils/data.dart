import 'dart:ui';

import '../model/Car_Model.dart';


const String baseURl = "https://mazda-uae.com";
List<CarModel> carList = [
  CarModel(
    carName: "MAZDA3",
    carModule: "HATCHBACK",
    carColor: [
      CarColor(
        images: [
          "$baseURl/media/meihrjn0/mazda3_bpl1_bekalab_47c_by9_ext_360_24_transparentpng_0001.png",
          "$baseURl/media/wrudoiln/mazda3_bpl1_bekalab_47c_by9_ext_360_24_transparentpng_0002.png",
          "$baseURl/media/yddd0gpd/mazda3_bpl1_bekalab_47c_by9_ext_360_24_transparentpng_0003.png",
          "$baseURl/media/tcvjwswb/mazda3_bpl1_bekalab_47c_by9_ext_360_24_transparentpng_0004.png",
          "$baseURl/media/xksntc0g/mazda3_bpl1_bekalab_47c_by9_ext_360_24_transparentpng_0005.png",
          "$baseURl/media/w4knb5pu/mazda3_bpl1_bekalab_47c_by9_ext_360_24_transparentpng_0006.png",
          "$baseURl/media/xafdhsbi/mazda3_bpl1_bekalab_47c_by9_ext_360_24_transparentpng_0007.png",
          "$baseURl/media/nb0hxxhi/mazda3_bpl1_bekalab_47c_by9_ext_360_24_transparentpng_0008.png",
          "$baseURl/media/wjlcashu/mazda3_bpl1_bekalab_47c_by9_ext_360_24_transparentpng_0009.png",
          "$baseURl/media/b0xf0vj3/mazda3_bpl1_bekalab_47c_by9_ext_360_24_transparentpng_0010.png",
          "$baseURl/media/afgdjyho/mazda3_bpl1_bekalab_47c_by9_ext_360_24_transparentpng_0011.png",
          "$baseURl/media/to2gxl2r/mazda3_bpl1_bekalab_47c_by9_ext_360_24_transparentpng_0012.png",
          "$baseURl/media/1hjmd5mr/mazda3_bpl1_bekalab_47c_by9_ext_360_24_transparentpng_0013.png",
          "$baseURl/media/qw5p21vb/mazda3_bpl1_bekalab_47c_by9_ext_360_24_transparentpng_0014.png",
          "$baseURl/media/hdnldsja/mazda3_bpl1_bekalab_47c_by9_ext_360_24_transparentpng_0015.png",
          "$baseURl/media/zpuf2rlr/mazda3_bpl1_bekalab_47c_by9_ext_360_24_transparentpng_0016.png",
          "$baseURl/media/u5xhpset/mazda3_bpl1_bekalab_47c_by9_ext_360_24_transparentpng_0017.png",
          "$baseURl/media/mbcmgsth/mazda3_bpl1_bekalab_47c_by9_ext_360_24_transparentpng_0018.png",
          "$baseURl/media/xcon0qee/mazda3_bpl1_bekalab_47c_by9_ext_360_24_transparentpng_0019.png",
          "$baseURl/media/gispiq5z/mazda3_bpl1_bekalab_47c_by9_ext_360_24_transparentpng_0020.png",
          "$baseURl/media/bvbdaynp/mazda3_bpl1_bekalab_47c_by9_ext_360_24_transparentpng_0021.png",
          "$baseURl/media/l0ebzrug/mazda3_bpl1_bekalab_47c_by9_ext_360_24_transparentpng_0022.png",
          "$baseURl/media/smvnw4ra/mazda3_bpl1_bekalab_47c_by9_ext_360_24_transparentpng_0023.png",
          "$baseURl/media/wg5dmslt/mazda3_bpl1_bekalab_47c_by9_ext_360_24_transparentpng_0024.png",
        ],
imagesFile:[],
        color: const Color(0xff676A71),
      ),
    ],
    carDetails:
        "A confident drive is a better drive. That’s why our available i-Activsense safety innovative use sophisticated technologies to help alert you to hazards before they happen. It’s another way Mazda lets you focus on what matters: driving. Book a Mazda3 hatchback test drive today to experience unrivaled safety.",
    carEngine: "153 HP @ 6000 RPM",
  ),
  CarModel(
    carName: "MAZDA3",
    carModule: "HATCHBACK",
    carColor: [
      CarColor(images: [
        "$baseURl/media/o41bpx5h/mazda3_bpl1_bekalab_46v_by9_ext_360_24_transparentpng_0001.png",
        "$baseURl/media/5w1jdhdb/mazda3_bpl1_bekalab_46v_by9_ext_360_24_transparentpng_0002.png",
        "$baseURl/media/gynkunhh/mazda3_bpl1_bekalab_46v_by9_ext_360_24_transparentpng_0003.png",
        "$baseURl/media/luhhg0gf/mazda3_bpl1_bekalab_46v_by9_ext_360_24_transparentpng_0004.png",
        "$baseURl/media/jnfbdge0/mazda3_bpl1_bekalab_46v_by9_ext_360_24_transparentpng_0005.png",
        "$baseURl/media/3utf3fyf/mazda3_bpl1_bekalab_46v_by9_ext_360_24_transparentpng_0006.png",
        "$baseURl/media/s0qly4yy/mazda3_bpl1_bekalab_46v_by9_ext_360_24_transparentpng_0007.png",
        "$baseURl/media/smjjrosj/mazda3_bpl1_bekalab_46v_by9_ext_360_24_transparentpng_0008.png",
        "$baseURl/media/ttvgrptm/mazda3_bpl1_bekalab_46v_by9_ext_360_24_transparentpng_0009.png",
        '$baseURl/media/11yfgxd5/mazda3_bpl1_bekalab_46v_by9_ext_360_24_transparentpng_0010.png',
        '$baseURl/media/20bnipoq/mazda3_bpl1_bekalab_46v_by9_ext_360_24_transparentpng_0011.png',
        '$baseURl/media/k5jpzdf5/mazda3_bpl1_bekalab_46v_by9_ext_360_24_transparentpng_0012.png',
        '$baseURl/media/2lxfddp5/mazda3_bpl1_bekalab_46v_by9_ext_360_24_transparentpng_0013.png',
        '$baseURl/media/brznp3ly/mazda3_bpl1_bekalab_46v_by9_ext_360_24_transparentpng_0014.png',
        '$baseURl/media/feia11qf/mazda3_bpl1_bekalab_46v_by9_ext_360_24_transparentpng_0015.png',
        '$baseURl/media/wj3lbjar/mazda3_bpl1_bekalab_46v_by9_ext_360_24_transparentpng_0016.png',
        '$baseURl/media/xd4obpiv/mazda3_bpl1_bekalab_46v_by9_ext_360_24_transparentpng_0017.png',
        '$baseURl/media/4vtb2whm/mazda3_bpl1_bekalab_46v_by9_ext_360_24_transparentpng_0018.png',
        '$baseURl/media/fufbe01y/mazda3_bpl1_bekalab_46v_by9_ext_360_24_transparentpng_0019.png',
        '$baseURl/media/youbjve4/mazda3_bpl1_bekalab_46v_by9_ext_360_24_transparentpng_0020.png',
        '$baseURl/media/dseb42th/mazda3_bpl1_bekalab_46v_by9_ext_360_24_transparentpng_0021.png',
        '$baseURl/media/sq0m2aoi/mazda3_bpl1_bekalab_46v_by9_ext_360_24_transparentpng_0022.png',
        '$baseURl/media/nk2dl5qq/mazda3_bpl1_bekalab_46v_by9_ext_360_24_transparentpng_0023.png',
        '$baseURl/media/5xggmqap/mazda3_bpl1_bekalab_46v_by9_ext_360_24_transparentpng_0024.png',
      ],imagesFile:[],
          color: const Color(0xff890000)),
    ],
    carDetails:
    "A confident drive is a better drive. That’s why our available i-Activsense safety innovative use sophisticated technologies to help alert you to hazards before they happen. It’s another way Mazda lets you focus on what matters: driving. Book a Mazda3 hatchback test drive today to experience unrivaled safety.",
    carEngine: "153 HP @ 6000 RPM",
  ),
  CarModel(
    carName: "MAZDA3",
    carModule: "HATCHBACK",
    carColor: [
      CarColor(images: [
        '$baseURl/media/evvka2z2/mazda3_bpl1_bekalab_41w_by9_ext_360_24_transparentpng_0001.png',
        '$baseURl/media/g4wpnb2z/mazda3_bpl1_bekalab_41w_by9_ext_360_24_transparentpng_0002.png',
        '$baseURl/media/1b0jy5qc/mazda3_bpl1_bekalab_41w_by9_ext_360_24_transparentpng_0003.png',
        '$baseURl/media/3d0dmmnx/mazda3_bpl1_bekalab_41w_by9_ext_360_24_transparentpng_0004.png',
        '$baseURl/media/sskmpu4a/mazda3_bpl1_bekalab_41w_by9_ext_360_24_transparentpng_0005.png',
        '$baseURl/media/5affin31/mazda3_bpl1_bekalab_41w_by9_ext_360_24_transparentpng_0006.png',
        '$baseURl/media/dbwpgij0/mazda3_bpl1_bekalab_41w_by9_ext_360_24_transparentpng_0007.png',
        '$baseURl/media/n0bfb2gu/mazda3_bpl1_bekalab_41w_by9_ext_360_24_transparentpng_0008.png',
        '$baseURl/media/qennddon/mazda3_bpl1_bekalab_41w_by9_ext_360_24_transparentpng_0009.png',
        '$baseURl/media/ielddpuz/mazda3_bpl1_bekalab_41w_by9_ext_360_24_transparentpng_0010.png',
        '$baseURl/media/qxmb51pb/mazda3_bpl1_bekalab_41w_by9_ext_360_24_transparentpng_0011.png',
        '$baseURl/media/lvzjcbr0/mazda3_bpl1_bekalab_41w_by9_ext_360_24_transparentpng_0012.png',
        '$baseURl/media/vkjjtsm2/mazda3_bpl1_bekalab_41w_by9_ext_360_24_transparentpng_0013.png',
        '$baseURl/media/uqqawmvq/mazda3_bpl1_bekalab_41w_by9_ext_360_24_transparentpng_0014.png',
        '$baseURl/media/wlbiu3za/mazda3_bpl1_bekalab_41w_by9_ext_360_24_transparentpng_0015.png',
        '$baseURl/media/xtfh5iak/mazda3_bpl1_bekalab_41w_by9_ext_360_24_transparentpng_0016.png',
        '$baseURl/media/apalpb1d/mazda3_bpl1_bekalab_41w_by9_ext_360_24_transparentpng_0017.png',
        '$baseURl/media/qlqaqu5x/mazda3_bpl1_bekalab_41w_by9_ext_360_24_transparentpng_0018.png',
        '$baseURl/media/d2khroc4/mazda3_bpl1_bekalab_41w_by9_ext_360_24_transparentpng_0019.png',
        '$baseURl/media/wzrpidpa/mazda3_bpl1_bekalab_41w_by9_ext_360_24_transparentpng_0020.png',
        '$baseURl/media/r4hmsszn/mazda3_bpl1_bekalab_41w_by9_ext_360_24_transparentpng_0021.png',
        '$baseURl/media/3maen3cf/mazda3_bpl1_bekalab_41w_by9_ext_360_24_transparentpng_0022.png',
        '$baseURl/media/uqjdfhzs/mazda3_bpl1_bekalab_41w_by9_ext_360_24_transparentpng_0023.png',
        '$baseURl/media/md0lkgnt/mazda3_bpl1_bekalab_41w_by9_ext_360_24_transparentpng_0024.png',
      ],imagesFile:[],
          color: const Color(0xff101312)),
    ],
    carDetails:
    "A confident drive is a better drive. That’s why our available i-Activsense safety innovative use sophisticated technologies to help alert you to hazards before they happen. It’s another way Mazda lets you focus on what matters: driving. Book a Mazda3 hatchback test drive today to experience unrivaled safety.",
    carEngine: "153 HP @ 6000 RPM",
  ),
  CarModel(
    carName: "Mazda MX-5",
    carModule: "Hardtop Convertible",
    carColor: [
      CarColor(
        imagesFile:[],

        images: [
          '$baseURl/media/dwhnjpvh/mx-5_ndl7_nf7plaa_47c_nl0_ext_360_24_transparentpng_0002.png',
          '$baseURl/media/bf5cjxqs/mx-5_ndl7_nf7plaa_47c_nl0_ext_360_24_transparentpng_0001.png',
          '$baseURl/media/bssehvm0/mx-5_ndl7_nf7plaa_47c_nl0_ext_360_24_transparentpng_0003.png',
          '$baseURl/media/j0ppfe4n/mx-5_ndl7_nf7plaa_47c_nl0_ext_360_24_transparentpng_0004.png',
          '$baseURl/media/kasnzyp1/mx-5_ndl7_nf7plaa_47c_nl0_ext_360_24_transparentpng_0005.png',
          '$baseURl/media/jwtfuvr5/mx-5_ndl7_nf7plaa_47c_nl0_ext_360_24_transparentpng_0006.png',
          '$baseURl/media/jwql3ge5/mx-5_ndl7_nf7plaa_47c_nl0_ext_360_24_transparentpng_0007.png',
          '$baseURl/media/wsxjrqvq/mx-5_ndl7_nf7plaa_47c_nl0_ext_360_24_transparentpng_0008.png',
          '$baseURl/media/jb5jk420/mx-5_ndl7_nf7plaa_47c_nl0_ext_360_24_transparentpng_0009.png',
          '$baseURl/media/0lfbwf4s/mx-5_ndl7_nf7plaa_47c_nl0_ext_360_24_transparentpng_0010.png',
          '$baseURl/media/ca1aywxk/mx-5_ndl7_nf7plaa_47c_nl0_ext_360_24_transparentpng_0011.png',
          '$baseURl/media/v4ghfpxo/mx-5_ndl7_nf7plaa_47c_nl0_ext_360_24_transparentpng_0012.png',
          '$baseURl/media/etwpxmti/mx-5_ndl7_nf7plaa_47c_nl0_ext_360_24_transparentpng_0013.png',
          '$baseURl/media/0pgairh1/mx-5_ndl7_nf7plaa_47c_nl0_ext_360_24_transparentpng_0014.png',
          '$baseURl/media/ah3j0snq/mx-5_ndl7_nf7plaa_47c_nl0_ext_360_24_transparentpng_0015.png',
          '$baseURl/media/ny4ewq0c/mx-5_ndl7_nf7plaa_47c_nl0_ext_360_24_transparentpng_0016.png',
          '$baseURl/media/yzrmcbej/mx-5_ndl7_nf7plaa_47c_nl0_ext_360_24_transparentpng_0017.png',
          '$baseURl/media/flehda5z/mx-5_ndl7_nf7plaa_47c_nl0_ext_360_24_transparentpng_0018.png',
          '$baseURl/media/c2tj4uni/mx-5_ndl7_nf7plaa_47c_nl0_ext_360_24_transparentpng_0019.png',
          '$baseURl/media/bshjoj5u/mx-5_ndl7_nf7plaa_47c_nl0_ext_360_24_transparentpng_0020.png',
          '$baseURl/media/s2lf0kmo/mx-5_ndl7_nf7plaa_47c_nl0_ext_360_24_transparentpng_0021.png',
          '$baseURl/media/c1bbpv0h/mx-5_ndl7_nf7plaa_47c_nl0_ext_360_24_transparentpng_0022.png',
          '$baseURl/media/mjfc4wxv/mx-5_ndl7_nf7plaa_47c_nl0_ext_360_24_transparentpng_0023.png',
          '$baseURl/media/r1nbwlaj/mx-5_ndl7_nf7plaa_47c_nl0_ext_360_24_transparentpng_0024.png',
        ],
        color: const Color(0xff676A71),
      ),
    ],
    carDetails:
        "A confident drive is a better drive. That’s why our available i-Activsense safety innovative use sophisticated technologies to help alert you to hazards before they happen. It’s another way Mazda lets you focus on what matters: driving. Book a Mazda3 hatchback test drive today to experience unrivaled safety.",
    carEngine: "",
  ),
  CarModel(
    carName: "Mazda MX-5",
    carModule: "Hardtop Convertible",
    carColor: [
      CarColor(
        imagesFile:[],

        images: [
          '$baseURl/media/x45l51fw/mx-5_ndl7_nf7plaa_46v_nk5_ext_360_24_transparentpng_0001.png',
          '$baseURl/media/1lafwzok/mx-5_ndl7_nf7plaa_46v_nk5_ext_360_24_transparentpng_0002.png',
          '$baseURl/media/ypvlb4wz/mx-5_ndl7_nf7plaa_46v_nk5_ext_360_24_transparentpng_0003.png',
          '$baseURl/media/4udibeo5/mx-5_ndl7_nf7plaa_46v_nk5_ext_360_24_transparentpng_0004.png',
          '$baseURl/media/pnoptyq5/mx-5_ndl7_nf7plaa_46v_nk5_ext_360_24_transparentpng_0005.png',
          '$baseURl/media/sw2flyye/mx-5_ndl7_nf7plaa_46v_nk5_ext_360_24_transparentpng_0006.png',
          '$baseURl/media/0gqccqsa/mx-5_ndl7_nf7plaa_46v_nk5_ext_360_24_transparentpng_0007.png',
          '$baseURl/media/ly1cmn4d/mx-5_ndl7_nf7plaa_46v_nk5_ext_360_24_transparentpng_0008.png',
          '$baseURl/media/j5ybnafp/mx-5_ndl7_nf7plaa_46v_nk5_ext_360_24_transparentpng_0009.png',
          '$baseURl/media/crkaugde/mx-5_ndl7_nf7plaa_46v_nk5_ext_360_24_transparentpng_0010.png',
          '$baseURl/media/xdyejoym/mx-5_ndl7_nf7plaa_46v_nk5_ext_360_24_transparentpng_0011.png',
          '$baseURl/media/va4nzfrc/mx-5_ndl7_nf7plaa_46v_nk5_ext_360_24_transparentpng_0012.png',
          '$baseURl/media/twwc2xie/mx-5_ndl7_nf7plaa_46v_nk5_ext_360_24_transparentpng_0013.png',
          '$baseURl/media/gljoygku/mx-5_ndl7_nf7plaa_46v_nk5_ext_360_24_transparentpng_0014.png',
          '$baseURl/media/iavjb1os/mx-5_ndl7_nf7plaa_46v_nk5_ext_360_24_transparentpng_0015.png',
          '$baseURl/media/lavh2biv/mx-5_ndl7_nf7plaa_46v_nk5_ext_360_24_transparentpng_0016.png',
          '$baseURl/media/t13nthk1/mx-5_ndl7_nf7plaa_46v_nk5_ext_360_24_transparentpng_0017.png',
          '$baseURl/media/rlga30p4/mx-5_ndl7_nf7plaa_46v_nk5_ext_360_24_transparentpng_0018.png',
          '$baseURl/media/ehsittym/mx-5_ndl7_nf7plaa_46v_nk5_ext_360_24_transparentpng_0019.png',
          '$baseURl/media/igsdmctj/mx-5_ndl7_nf7plaa_46v_nk5_ext_360_24_transparentpng_0020.png',
          '$baseURl/media/nykfj4s2/mx-5_ndl7_nf7plaa_46v_nk5_ext_360_24_transparentpng_0021.png',
          '$baseURl/media/dcvk04zn/mx-5_ndl7_nf7plaa_46v_nk5_ext_360_24_transparentpng_0022.png',
          '$baseURl/media/noqdflnp/mx-5_ndl7_nf7plaa_46v_nk5_ext_360_24_transparentpng_0023.png',
          '$baseURl/media/m2ha41vf/mx-5_ndl7_nf7plaa_46v_nk5_ext_360_24_transparentpng_0024.png',
        ],
        color: const Color(0xff890000),
      ),
    ],
    carDetails:
    "A confident drive is a better drive. That’s why our available i-Activsense safety innovative use sophisticated technologies to help alert you to hazards before they happen. It’s another way Mazda lets you focus on what matters: driving. Book a Mazda3 hatchback test drive today to experience unrivaled safety.",
    carEngine: "",
  ),
  CarModel(
    carName: "Mazda MX-5",
    carModule: "Hardtop Convertible",
    carColor: [
      CarColor(
        imagesFile:[],
        images: [
          '$baseURl/media/4fvnzor4/mx-5_ndl7_nf7plaa_41w_nj2_ext_360_24_transparentpng_0001.png',
          '$baseURl/media/olaojbmb/mx-5_ndl7_nf7plaa_41w_nj2_ext_360_24_transparentpng_0002.png',
          '$baseURl/media/nw5pa40b/mx-5_ndl7_nf7plaa_41w_nj2_ext_360_24_transparentpng_0003.png',
          '$baseURl/media/brca5dkf/mx-5_ndl7_nf7plaa_41w_nj2_ext_360_24_transparentpng_0004.png',
          '$baseURl/media/2opnbdbw/mx-5_ndl7_nf7plaa_41w_nj2_ext_360_24_transparentpng_0005.png',
          '$baseURl/media/nnkkolu2/mx-5_ndl7_nf7plaa_41w_nj2_ext_360_24_transparentpng_0006.png',
          '$baseURl/media/qnipsyko/mx-5_ndl7_nf7plaa_41w_nj2_ext_360_24_transparentpng_0007.png',
          '$baseURl/media/jqrdu4zz/mx-5_ndl7_nf7plaa_41w_nj2_ext_360_24_transparentpng_0008.png',
          '$baseURl/media/x52biect/mx-5_ndl7_nf7plaa_41w_nj2_ext_360_24_transparentpng_0009.png',
          '$baseURl/media/zhappish/mx-5_ndl7_nf7plaa_41w_nj2_ext_360_24_transparentpng_0010.png',
          '$baseURl/media/lmae5pif/mx-5_ndl7_nf7plaa_41w_nj2_ext_360_24_transparentpng_0011.png',
          '$baseURl/media/yrdny00j/mx-5_ndl7_nf7plaa_41w_nj2_ext_360_24_transparentpng_0012.png',
          '$baseURl/media/4pxds5xr/mx-5_ndl7_nf7plaa_41w_nj2_ext_360_24_transparentpng_0013.png',
          '$baseURl/media/oh3df053/mx-5_ndl7_nf7plaa_41w_nj2_ext_360_24_transparentpng_0014.png',
          '$baseURl/media/2kpa0t0g/mx-5_ndl7_nf7plaa_41w_nj2_ext_360_24_transparentpng_0015.png',
          '$baseURl/media/usjhgfp0/mx-5_ndl7_nf7plaa_41w_nj2_ext_360_24_transparentpng_0016.png',
          '$baseURl/media/r4lhpmfw/mx-5_ndl7_nf7plaa_41w_nj2_ext_360_24_transparentpng_0017.png',
          '$baseURl/media/2amn251t/mx-5_ndl7_nf7plaa_41w_nj2_ext_360_24_transparentpng_0018.png',
          '$baseURl/media/fxcdyypw/mx-5_ndl7_nf7plaa_41w_nj2_ext_360_24_transparentpng_0019.png',
          '$baseURl/media/x3xjwump/mx-5_ndl7_nf7plaa_41w_nj2_ext_360_24_transparentpng_0020.png',
          '$baseURl/media/4fjowrlc/mx-5_ndl7_nf7plaa_41w_nj2_ext_360_24_transparentpng_0021.png',
          '$baseURl/media/goxloaz3/mx-5_ndl7_nf7plaa_41w_nj2_ext_360_24_transparentpng_0022.png',
          '$baseURl/media/bjuhyatb/mx-5_ndl7_nf7plaa_41w_nj2_ext_360_24_transparentpng_0023.png',
          '$baseURl/media/zkpb3xmd/mx-5_ndl7_nf7plaa_41w_nj2_ext_360_24_transparentpng_0024.png',
        ],
        color: const Color(0xff101312),
      ),
    ],
    carDetails:
    "A confident drive is a better drive. That’s why our available i-Activsense safety innovative use sophisticated technologies to help alert you to hazards before they happen. It’s another way Mazda lets you focus on what matters: driving. Book a Mazda3 hatchback test drive today to experience unrivaled safety.",
    carEngine: "",
  ),
];
