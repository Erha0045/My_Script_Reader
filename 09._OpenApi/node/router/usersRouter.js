import { Router } from "express";
const router = Router();

const users = [{
    id: 1,
    name: "John Doe"
}];

const spacecrafts = [{
    id: 1,
    name: "Spacecraft 1"
}];

/**
 * @openapi
 * /api/users:
 *   get:
 *     description: Get all users
 *     responses:
 *       200:
 *         description: Returns all users
 */
router.get("/api/users", (req, res) => {
    res.send({ data: users });
});


/**
 * @openapi
 * /api/users:
 *   get:
 *     description:  Create a new user
 *     responses:
 *       200:
 *         description: Returns all users.
 *        
 */

router.post("/api/users", (req, res) => {
    const user = req.body;
    users.push(user);
    res.send({ data: user });
});

/**
 * @openapi
 * /api/spacecrafts:
 *   get:
 *     description: Get all users
 *     responses:
 *       200:
 *         description: Returns all users
 */
router.get("/api/spacecrafts{id}", (req, res) => {
    res.send({ data: spacecrafts });
});




export default router;
