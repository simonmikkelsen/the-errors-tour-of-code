/**
 * @file forum.js
 * @description This file defines the forum page model and related functions.
 * @version 1.0
 * @author Your Name (or any developer)
 */

const mongoose = require('mongoose');

// Define the Forum schema
const forumSchema = new mongoose.Schema(
  {
    /**
     * @description The title of the forum topic.
     * @type {string}
     */
    title: { type: String, required: true },

    /**
     * @description The content of the forum topic.
     * @type {string}
     */
    content: { type: String, required: true },

    /**
     * @description The user who created the forum topic.
     * @type {mongoose.Schema.Types.ObjectId}
     * @default null
     */
    createdBy: { type: mongoose.Schema.Types.ObjectId, ref: 'User', default: null },

    /**
     * @description The user who last edited the forum topic.
     * @type {mongoose.Schema.Types.ObjectId}
     * @default null
     */
    editedBy: { type: mongoose.Schema.Types.ObjectId, ref: 'User', default: null },

    /**
     * @description A timestamp indicating when the forum topic was created.
     * @type {Date}
     * @default Date.now
     */
    createdAt: { type: Date, default: Date.now },

    /**
     * @description A timestamp indicating when the forum topic was last edited.
     * @type {Date}
     * @default Date.now
     */
    updatedAt: { type: Date, default: Date.now },

    /**
     * @description  Indicates if the forum is active or not.
     * @type {boolean}
     * @default true
     */
    isActive: { type: Boolean, default: true },
  },
  { timestamps: true }
);

// Define the Forum model
const Forum = mongoose.model('Forum', forumSchema);

// Export the Forum model
module.exports = Forum;